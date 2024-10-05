import 'dart:async';

import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/backend/services/auth/auth_api_services.dart';
import 'package:dchange/controller/auth/sign_in/reset_password_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../backend/model/auth/forgot_password_model.dart';
import '../../../backend/model/auth/otp_verification_model.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';

class OtpVerificationController extends GetxController {
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
    resendOtpProcess();
  }

  /// >> set loading process & Otp Verification Model
  final _isLoading = false.obs;
  late OtpVerificationModel _otpVerificationModel;

  /// >> get loading process & Otp Verification Model
  bool get isLoading => _isLoading.value;
  OtpVerificationModel get otpVerificationModel => _otpVerificationModel;

  ///* Otp verify process
  Future<OtpVerificationModel> otpVerifyProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'otp': currentText.value,
      'token': userToken.value
    };
    await AuthApiServices.forgetPassVerifyOTPApi(body: inputBody).then((value) {
      _otpVerificationModel = value!;

      goToResetPasswordScreen(
          _otpVerificationModel.data.passwordResetData.token);

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _otpVerificationModel;
  }

  final resetPassController = Get.put(ResetPasswordController());
  void goToResetPasswordScreen(String token) {
    resetPassController.userToken.value = token;
    Get.offNamed(Routes.resetPasswordScreen);
  }

  /// >> set loading process & Forgot Password Model
  final _isForgotPasswordLoading = false.obs;
  late ForgotPasswordModel _forgotPasswordModel;

  /// >> get loading process & Forgot Password Model
  bool get isForgotPasswordLoading => _isForgotPasswordLoading.value;
  ForgotPasswordModel get forgotPasswordModel => _forgotPasswordModel;

  ///* Resend otp process
  Future<ForgotPasswordModel> resendOtpProcess() async {
    _isForgotPasswordLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'credentials': LocalStorage.getEmail(),
    };
    await AuthApiServices.forgotPasswordProcessApi(body: inputBody)
        .then((value) {
      _forgotPasswordModel = value!;
      userToken.value = _forgotPasswordModel.data.user.token;
      _isForgotPasswordLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isForgotPasswordLoading.value = false;
    update();
    return _forgotPasswordModel;
  }
}
