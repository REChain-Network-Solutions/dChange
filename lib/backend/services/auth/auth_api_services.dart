import 'package:dchange/backend/model/auth/sign_in_model.dart';
import 'package:dchange/backend/model/common/common_success_model.dart';

import '../../model/auth/forgot_password_model.dart';
import '../../model/auth/otp_verification_model.dart';
import '../../model/auth/sign_up_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class AuthApiServices {
  ///* Sign in api services
  static Future<SignInModel?> signInProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.loginURL,
        body,
        code: 200,
        showResult: true,
      );
      if (mapResponse != null) {
        SignInModel result = SignInModel.fromJson(mapResponse);
        // CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Sign in api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in SignInModel');
      return null;
    }
    return null;
  }

  ///* Forgot Password Process Api
  static Future<ForgotPasswordModel?> forgotPasswordProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordSendOtpURL,
        code: 200,
        body,
      );
      if (mapResponse != null) {
        ForgotPasswordModel result = ForgotPasswordModel.fromJson(mapResponse);
        CustomSnackBar.success(
          result.message.success.first.toString(),
        );
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from forgot password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in forgotPasswordModel');
      return null;
    }
    return null;
  }

  ///* Forgot password otp verify process api
  static Future<OtpVerificationModel?> forgetPassVerifyOTPApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotOtpVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        OtpVerificationModel result =
            OtpVerificationModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Forgot password otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in OtpVerificationModel');
      return null;
    }
    return null;
  }

  ///* Two fa otp verify process api
  static Future<CommonSuccessModel?> twoFaVerifyOTPApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.twoFaOtoVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Two fa otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Reset password process api
  static Future<CommonSuccessModel?> resetPasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.resetPasswordURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Reset password process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Reset password process api');
      return null;
    }
    return null;
  }

  ///* Change password process api
  static Future<CommonSuccessModel?> changePasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.passwordUpdateURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Change password process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Change password process api');
      return null;
    }
    return null;
  }

  ///______________________________  SIGN UP API PROCESS _____________________________

  ///* Sign up process api
  static Future<SignUpModel?> signUpProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.registerURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        SignUpModel result = SignUpModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Sign up api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in SignUpModel');
      return null;
    }
    return null;
  }

  ///* Email otp verify process api
  static Future<CommonSuccessModel?> emailOtpVerifyApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.registerOtpVerifyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Email otp verify process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Email otp verify process api');
      return null;
    }
    return null;
  }

  ///* Email resend otp process api
  static Future<CommonSuccessModel?> emailResendProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.registerOtpResendURL,
        {},
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  Email resend otp process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Email resend otp process api');
      return null;
    }
    return null;
  }

  ///  Sign out process api
  static Future<CommonSuccessModel?> signOutProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse =
          await ApiMethod(isBasic: false).get(ApiEndpoint.logOutURL, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('err from Sign out process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
