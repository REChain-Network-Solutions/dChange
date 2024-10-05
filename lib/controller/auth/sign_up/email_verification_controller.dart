import 'dart:async';
import 'package:dchange/backend/services/auth/auth_api_services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../views/congratulation/congratulation_screen.dart';

class EmailVerificationController extends GetxController {
  final pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  var currentText = ''.obs;

  get onSubmit => emailOtpSubmitProcess();

  _onSubmitEmailCode() {
    Get.to(
      () => const CongratulationScreen(
        route: Routes.navigationScreen,
        subTitle: Strings.yourAccountHas,
        title: Strings.congratulations,
      ),
    );
  }

  changeCurrentText(value) {
    currentText.value = value;
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    timerInit();
    super.onInit();
  }

  timerInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining.value != 0) {
        secondsRemaining.value--;
      } else {
        enableResend.value = true;
      }
    });
  }

  RxInt secondsRemaining = 59.obs;
  RxBool enableResend = false.obs;
  Timer? timer;

  resendCode() {
    secondsRemaining.value = 59;
    enableResend.value = false;
    resendOtpProcess();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late CommonSuccessModel _emailOtpSubmitModel;
  CommonSuccessModel get emailOtpSubmitModel => _emailOtpSubmitModel;

  Future<CommonSuccessModel> emailOtpSubmitProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp': currentText.value,
    };
    await AuthApiServices.emailOtpVerifyApi(body: inputBody).then((value) {
      _emailOtpSubmitModel = value!;

      if (LocalStorage.getTwoFaID()) {
        //  Get.toNamed(Routes.twoFactorVerificationScreen);
      } else {
        _onSubmitEmailCode();
      }
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _emailOtpSubmitModel;
  }

  final _resendLoading = false.obs;
  bool get resendLoading => _resendLoading.value;

  Future<CommonSuccessModel> resendOtpProcess() async {
    _resendLoading.value = true;
    pinCodeController.clear();
    update();

    await AuthApiServices.emailResendProcessApi().then((value) {
      _emailOtpSubmitModel = value!;

      _resendLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _resendLoading.value = false;
    update();
    return _emailOtpSubmitModel;
  }
}
