import 'package:dchange/backend/model/money_out/money_out_info_model.dart';
import 'package:dchange/backend/services/money_out/money_out_api_service.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:flutter/services.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/money_out/money_out_insert_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../routes/routes.dart';
import '../../utils/basic_widget_imports.dart';
import '../../views/congratulation/congratulation_screen.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/inputs/withdraw_image_picker.dart';

class MoneyOutController extends GetxController {
  final moneyOutAmountTextController = TextEditingController();
  RxString selectedCurrencyAlias = "".obs;
  RxString selectedCurrencyName = "".obs;
  RxString selectedCurrencyType = "".obs;
  RxString selectedGatewaySlug = "".obs;
  RxString currencyCode = "".obs;
  RxString gatewayTrx = "".obs;
  RxInt selectedCurrencyId = 0.obs;
  RxDouble limitMin = 0.0.obs;
  RxDouble limitMax = 0.0.obs;
  RxDouble percentCharge = 0.0.obs;
  RxDouble percentsCharge = 0.0.obs;
  RxDouble rate = 0.0.obs;
  RxDouble fixesCharge = 0.0.obs;
  RxDouble fees = 0.0.obs;
  RxDouble payable = 0.0.obs;
  RxString currencyCode2 = "".obs;
  RxDouble amount = 0.0.obs;
  RxDouble willGet = 0.0.obs;
  //dynamic dropdown
  RxString paymentGateway = "".obs;
  RxString dropdownName = "".obs;
  RxString dropdownValue = "".obs;

  List<String> baseCurrencyList = [];

  //dropdown
  List<String> dropdownList = <String>[].obs;
  RxString selectType = "".obs;
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  RxBool hasFile = false.obs;
  List<Currency> allCurrencyList = [];

  //now added
  RxString baseCurrency = "".obs;
  RxString baseCurrencyFlag = "".obs;
  RxString exchangeRate = "".obs;
  RxString selectWallet = "".obs;
  RxString selectAlias = "".obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];

  String enteredAmount = "";
  String transferFeeAmount = "";
  String totalCharge = "";
  String youWillGet = "";
  String payableAmount = "";

  List<String> totalAmount = [];
  @override
  void dispose() {
    moneyOutAmountTextController.dispose();

    super.dispose();
  }

  RxString selectItem = ''.obs;
  List<String> keyboardItemList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '<'
  ];

  inputItem(int index) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onLongPress: () {
        if (index == 11) {
          if (totalAmount.isNotEmpty) {
            totalAmount.clear();
            moneyOutAmountTextController.text = totalAmount.join('');
          } else {
            return;
          }
        }
      },
      onTap: () {
        if (index == 11) {
          if (totalAmount.isNotEmpty) {
            totalAmount.removeLast();
            moneyOutAmountTextController.text = totalAmount.join('');
          } else {
            return;
          }
        } else {
          if (totalAmount.contains('.') && index == 9) {
            return;
          } else {
            totalAmount.add(keyboardItemList[index]);
            moneyOutAmountTextController.text = totalAmount.join('');
            debugPrint(totalAmount.join(''));
          }
        }
      },
      child: Center(
        child: CustomTitleHeadingWidget(
          text: keyboardItemList[index],
          style: Get.isDarkMode
              ? CustomStyle.lightHeading2TextStyle.copyWith(
                  fontSize: Dimensions.headingTextSize3 * 2,
                )
              : CustomStyle.darkHeading2TextStyle.copyWith(
                  color: CustomColor.primaryLightTextColor,
                  fontSize: Dimensions.headingTextSize3 * 2,
                ),
        ),
      ),
    );
  }

  @override
  void onInit() {
    getMoneyOutData();
    moneyOutAmountTextController.text = '0.0';
    super.onInit();
  }

// get wallet
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late WithdrawInfoModel _withdrawInfoModel;

  WithdrawInfoModel get withdrawInfoModel => _withdrawInfoModel;

  Future<WithdrawInfoModel> getMoneyOutData() async {
    _isLoading.value = true;
    update();
    await MoneyOutApiServices.withdrawInfoApi().then((value) {
      _withdrawInfoModel = value!;

      for (var gateways in withdrawInfoModel.data.gateways) {
        for (var currency in gateways.currencies) {
          allCurrencyList.add(
            Currency(
              createdAt: currency.createdAt,
              updatedAt: currency.updatedAt,
              id: currency.id,
              paymentGatewayId: currency.paymentGatewayId,
              name: currency.name,
              alias: currency.alias,
              currencyCode: currency.currencyCode,
              currencySymbol: currency.currencySymbol,
              minLimit: currency.minLimit,
              maxLimit: currency.maxLimit,
              percentCharge: currency.percentCharge,
              fixedCharge: currency.fixedCharge,
              rate: currency.rate,
              type: currency.type,
              image: currency.image,
            ),
          );
        }
        Currency currency =
            withdrawInfoModel.data.gateways.first.currencies.first;
        selectAlias.value = currency.alias;
        selectWallet.value = currency.name;
        baseCurrency.value = withdrawInfoModel.data.baseCurr;
        limitMin.value = currency.minLimit.toDouble() / currency.rate;
        limitMax.value = currency.maxLimit.toDouble() /currency.rate;
        currencyCode.value = currency.currencyCode;

      
          baseCurrencyFlag.value =
              "${ApiEndpoint.mainDomain}/${withdrawInfoModel.data.flagPath}/${withdrawInfoModel.data.flag}";
       
      }

      _isLoading.value = false;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _withdrawInfoModel;
  }

  goToMoneyOutPreviewScreen() {
    Get.toNamed(Routes.moneyOutPreviewScreen);
  }

  final _isInsertLoading = false.obs;
  bool get isInsertLoading => _isInsertLoading.value;
//money out insert process

  late DynamicInputWithdrawModel _moneyOutInsertModel;

  DynamicInputWithdrawModel get moneyOutInsertModel => _moneyOutInsertModel;

  ///* A -dd Money manual insert api process start
  Future<DynamicInputWithdrawModel> manualPaymentGetGatewaysProcess() async {
    _isInsertLoading.value = true;
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();

    Map<String, dynamic> inputBody = {
      'amount': moneyOutAmountTextController.text,
      'gateway': selectAlias.value,
    };

    await MoneyOutApiServices.withdrawInsertApi(body: inputBody).then((value) {
      _moneyOutInsertModel = value!;

      final previewData = _moneyOutInsertModel.data.paymentInformations;
      enteredAmount = previewData.requestAmount;
      transferFeeAmount = previewData.totalCharge;
      youWillGet = previewData.willGet;

      ///* Add money manual insert api process start
      final data = _moneyOutInsertModel.data.inputFields;

      for (int item = 0; item < data.length; item++) {
        // make the dynamic controller
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);

        // make dynamic input widget
        if (data[item].type.contains('file')) {
          hasFile.value = true;
          inputFields.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: WithdrawManualPaymentImageWidget(
                labelName: data[item].label,
                fieldName: data[item].name,
              ),
            ),
          );
        } else if (data[item].type.contains('text') ||
            data[item].type.contains('textarea')) {
          inputFields.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllers[item],
                  label: data[item].label,
                  hintText: data[item].label,
                  isValidator: data[item].required,
                  fillColor: Theme.of(Get.context!).colorScheme.background,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      int.parse(data[item].validation.max.toString()),
                    ),
                  ],
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }

      //-------------------------- Process inputs end --------------------------
      Routes.moneyOutManualPaymentScreen.toNamed;
      _isInsertLoading.value = false;

      update();
    }).catchError((onError) {
      _isInsertLoading.value = false;
      log.e(onError);
    });

    update();
    return _moneyOutInsertModel;
  }

  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;
  //! ---------------------------- Add Money Manual Payment Process -------------------------

  late CommonSuccessModel _manualPaymentConfirmModel;
  CommonSuccessModel get manualPaymentConfirmModel =>
      _manualPaymentConfirmModel;

  Future<CommonSuccessModel> confirmProcess() async {
    _isConfirmLoading.value = true;
    Map<String, String> inputBody = {
      'trx': moneyOutInsertModel.data.paymentInformations.trx,
    };

    final data = moneyOutInsertModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await MoneyOutApiServices.withdrawSubmitApi(
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _manualPaymentConfirmModel = value!;

      Get.to(
        () => CongratulationScreen(
          route: Routes.navigationScreen,
          subTitle: _manualPaymentConfirmModel.message.success.first,
          title: Strings.congratulations,
        ),
      );
      _isConfirmLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isConfirmLoading.value = false;
    update();
    return _manualPaymentConfirmModel;
  }
}
