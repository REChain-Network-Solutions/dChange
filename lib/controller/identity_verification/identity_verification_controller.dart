import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/kyc/kyc_info_model.dart';
import '../../backend/services/kyc/kyc_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../views/congratulation/congratulation_screen.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/kyc/kyc_dynamic_dropdown.dart';
import '../../widgets/common/kyc/kyc_dynamic_image_widget.dart';

class IdentityVerificationController extends GetxController {
  List<TextEditingController> inputFieldControllers = [];
  final trackController = TextEditingController();
  RxList inputFields = [].obs;
  RxList inputFileFields = [].obs;
  List<String> dropdownList = <String>[].obs;
  RxString selectType = "".obs;

  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxBool hasFile = false.obs;

  RxString trx = ''.obs;

  get onSubmitKyc => kycSubmitApiProcess();

  @override
  void onInit() {
    getKycInfoProcess();
    super.onInit();
  }

  /// >> set loading process & Kyc Info Model
  final _isLoading = false.obs;
  final _isSubmitLoading = false.obs;
  late KycInfoModel _kycInfoModel;

  /// >> get loading process & Kyc Info Model
  bool get isLoading => _isLoading.value;
  bool get isSubmitLoading => _isSubmitLoading.value;
  KycInfoModel get kycInfoModel => _kycInfoModel;

  ///* Get trade info api process
  Future<KycInfoModel> getKycInfoProcess() async {
    _isLoading.value = true;
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();

    await KycApiServices.getKycInfoApi().then((value) {
      _kycInfoModel = value!;
      final data = _kycInfoModel.data.inputFields;

      _getDynamicInputField(data);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _kycInfoModel;
  }

  /// >>> set and get model for kyc submit
  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  ///* Kyc submit api process
  Future<CommonSuccessModel> kycSubmitApiProcess() async {
    _isSubmitLoading.value = true;
    Map<String, String> inputBody = {};

    final data = kycInfoModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await KycApiServices.kycSubmitProcessApi(
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _commonSuccessModel = value!;
      onConfirmProcess(
          message: _commonSuccessModel.message.success.first.toString());
      inputFields.clear();
      listImagePath.clear();
      listFieldName.clear();
      inputFieldControllers.clear();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isSubmitLoading.value = false;
    update();
    return _commonSuccessModel;
  }

  void onConfirmProcess({required String message}) {
    Get.to(
      () => CongratulationScreen(
        route: Routes.navigationScreen,
        subTitle: message,
        title: Strings.congratulations,
      ),
    );
  }

  _getDynamicInputField(List<InputField> data) {
    for (int item = 0; item < data.length; item++) {
      // make the dynamic controller
      var textEditingController = TextEditingController();
      inputFieldControllers.add(textEditingController);
      // make dynamic input widget
      if (data[item].type.contains('select')) {
        hasFile.value = true;
        selectType.value = data[item].validation.options.first.toString();
        inputFieldControllers[item].text = selectType.value;
        dropdownList = data[item].validation.options;
        inputFields.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.marginBetweenInputTitleAndBox,
              ),
              CustomTitleHeadingWidget(
                text: data[item].label,
                style: CustomStyle.darkHeading4TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.primaryLightTextColor,
                ),
              ),
              SizedBox(
                height: Dimensions.marginBetweenInputTitleAndBox,
              ),
              KycDynamicDropDown(
                selectMethod: selectType,
                itemsList: dropdownList,
                onChanged: (value) {
                  selectType.value = value!;
                  inputFieldControllers[item].text = selectType.value;
                  debugPrint(selectType.value);
                },
              ),
            ],
          ),
        );
      } else if (data[item].type.contains('file')) {
        hasFile.value = true;
        inputFileFields.add(
          Column(
            mainAxisAlignment: mainStart,
            crossAxisAlignment: crossStart,
            children: [
              SizedBox(
                height: Dimensions.marginBetweenInputTitleAndBox,
              ),
              CustomTitleHeadingWidget(
                text: data[item].label,
                style: CustomStyle.darkHeading4TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CustomColor.primaryLightTextColor,
                ),
              ),
              SizedBox(
                height: Dimensions.marginBetweenInputTitleAndBox,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: UpdateKycImageWidget(
                  labelName: data[item].label,
                  fieldName: data[item].name,
                ),
              ),
            ],
          ),
        );
      } else if (data[item].type.contains('text')) {
        inputFields.add(
          Column(
            mainAxisAlignment: mainStart,
            crossAxisAlignment: crossStart,
            children: [
              SizedBox(
                height: Dimensions.marginBetweenInputTitleAndBox,
              ),
              PrimaryInputWidget(
                controller: inputFieldControllers[item],
                hintText: '${Strings.enter} ${data[item].label}',
                label: data[item].label,
              ),
            ],
          ),
        );
      }
    }
  }

  updateImageData(String fieldName, String imagePath) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      listImagePath[itemIndex] = imagePath;
    } else {
      listFieldName.add(fieldName);
      listImagePath.add(imagePath);
    }
    update();
  }

  String? getImagePath(String fieldName) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      return listImagePath[itemIndex];
    }
    return null;
  }
}
