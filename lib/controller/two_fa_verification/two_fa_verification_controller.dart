import 'package:dchange/backend/model/common/common_success_model.dart';
import 'package:dchange/backend/services/two_fa/two_fa_api_services.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:get/get.dart';

import '../../backend/model/two_fa/two_fa_info_model.dart';
import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';

class TwoFaVerificationController extends GetxController {
  get onEnableOrDisable => twoFaSubmitApiProcess();
  RxString qrCode = ''.obs;
  RxString alert = ''.obs;
  RxInt status = 0.obs;

  @override
  void onInit() {
    twoFaGetApiProcess();
    super.onInit();
  }

  /// >> set loading process & TwoFa Info Model
  final _isLoading = false.obs;
  late TwoFaInfoModel _twoFaInfoModel;

  /// >> get loading process & TwoFa Info Model
  bool get isLoading => _isLoading.value;
  TwoFaInfoModel get twoFaInfoModel => _twoFaInfoModel;

  ///* Two Fa get api process
  Future<TwoFaInfoModel> twoFaGetApiProcess() async {
    _isLoading.value = true;
    update();

    await TwoFaApiServices.twoFaGetApiProcess().then((value) {
      _twoFaInfoModel = value!;
      _setData(_twoFaInfoModel);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _twoFaInfoModel;
  }

  /// >> set loading process & Two Fa Submit Model
  final _isSubmitLoading = false.obs;
  late CommonSuccessModel _twoFaSubmitModel;

  /// >> get loading process & Two Fa Submit Model
  bool get isSubmitLoading => _isSubmitLoading.value;
  CommonSuccessModel get twoFaSubmitModel => _twoFaSubmitModel;

  ///* Two fa submit api process
  Future<CommonSuccessModel> twoFaSubmitApiProcess() async {
    _isSubmitLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'status': status.value == 0 ? '1' : '0',
    };

    await TwoFaApiServices.twoFaSubmitApiProcess(
      body: inputBody,
    ).then((value) {
      _twoFaSubmitModel = value!;
      Routes.navigationScreen.offAllNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isSubmitLoading.value = false;
    update();
    return _twoFaSubmitModel;
  }

  _setData(TwoFaInfoModel twoFaInfoModel) {
    qrCode.value = twoFaInfoModel.data.qrCode;
    alert.value = twoFaInfoModel.data.alert;
    status.value = twoFaInfoModel.data.qrStatus;
  }
}
