import 'dart:async';
import 'package:dchange/backend/model/common/common_success_model.dart';
import 'package:dchange/backend/services/auth/auth_api_services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';

class TwoFaVerificationController extends GetxController {
  final pinCodeController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  RxString userToken = ''.obs;
  var currentText = ''.obs;

  get onSubmit => otpVerifyProcess();

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
    timerInit();
  }

  /// >> set loading process & Two Fa Otp Verification Model
  final _isLoading = false.obs;
  late CommonSuccessModel _twoFaOtpVerificationModel;

  /// >> get loading process & Two Fa Otp Verification Model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get twoFaOtpVerificationModel =>
      _twoFaOtpVerificationModel;

  ///* Otp verify process
  Future<CommonSuccessModel> otpVerifyProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp': currentText.value,
    };
    await AuthApiServices.twoFaVerifyOTPApi(body: inputBody).then((value) {
      _twoFaOtpVerificationModel = value!;
      goToTwoFaOtpVerificationScreen();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _twoFaOtpVerificationModel;
  }

  void goToTwoFaOtpVerificationScreen() {
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    Get.offNamed(Routes.navigationScreen);
  }
}
