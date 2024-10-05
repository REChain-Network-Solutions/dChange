import 'package:dchange/extensions/custom_extensions.dart';

class ApiEndpoint {
  static const String mainDomain = "https://adchange.appdevs.net/";
  static const String baseUrl = "$mainDomain/api/v1";

  //-> Login
  static String loginURL = '/user/login'.addBaseURl();

  //-> Forgot Password

  static String forgotPasswordSendOtpURL =
      '/user/forgot/password/send/otp'.addBaseURl();
  static String forgotOtpVerifyURL =
      '/user/forgot/password/verify'.addBaseURl();
  static String resetPasswordURL = '/user/forgot/password/reset'.addBaseURl();

  //-> Register
  static String registerURL = '/user/register'.addBaseURl();
  static String registerOtpVerifyURL = '/user/email/otp/verify'.addBaseURl();
  static String registerOtpResendURL = '/user/email/resend/code'.addBaseURl();
  static String registerSmsCodeVerifyURL = '/user/sms/otp/verify'.addBaseURl();
  static String registerSmsCodeResendURL = '/user/sms/resend/code'.addBaseURl();
  static String logOutURL = '/user/logout'.addBaseURl();

  //-> Profile
  static String profileInfoGetURL = '/user/profile'.addBaseURl();
  static String profileUpdateURL = '/user/profile/update'.addBaseURl();
  static String passwordUpdateURL =
      '/user/profile/password/update'.addBaseURl();

  //-> Change password
  static String changePasswordURL =
      '/user/profile/password/update'.addBaseURl();

  //-> My Trade
  static String myTradeInfoURL = '/user/my-excrow'.addBaseURl();
  static String myTradeSubmitURL = '/user/my-excrow/submit'.addBaseURl();
  static String myTradeConfirmURL = '/user/my-excrow/confirm'.addBaseURl();
  static String myTradeCloseURL = '/user/my-excrow/close'.addBaseURl();
  static String myTradeEditURL = '/user/my-excrow/edit'.addBaseURl();
  static String myTradeUpdateURL = '/user/my-excrow/update'.addBaseURl();

  //-> Kyc
  static String kycInfoURL = '/user/profile/kyc/input-fields'.addBaseURl();
  static String kycSubmitURL = '/user/profile/kyc/submit'.addBaseURl();

  //-> Fee Calculator
  static String getCalculatorURL = '/user/calculator'.addBaseURl();

  //-> About Us
  static String aboutUsURL = '/user/sections/about-us?language=en'.addBaseURl();

  //-> Two Facator
  static String twoFactorStatusURL = '/user/2fa/status'.addBaseURl();
  static String twoFactorSubmitURL = '/user/2fa/submit'.addBaseURl();
  static String twoFactorVerifyURL = '/user/2fa/verify'.addBaseURl();
  static String twoFactorResendURL = '/user/2fa/resend'.addBaseURl();
  static String twoFactorDisabledURL = '/user/2fa/disabled'.addBaseURl();

  //-> Buying Transactions
  static String buyingTransactionsURL =
      '/user/transactions/buying'.addBaseURl();
  static String basicSettingsURL = '/basic/settings'.addBaseURl();

  ///Currency
  static String currencyListUrl = '/user/currency/list'.addBaseURl();

  /// Add money
  static String addMoneyInfoURL = '/user/add-money/information'.addBaseURl();
  static String addMoneyInsertURL = '/user/add-money/submit-data'.addBaseURl();
  static String addMoneyManualPaymentConfirm =
      '/user/add-money/manual/payment/confirmed'.addBaseURl();
  static String stripePayConfirm =
      '/user/add-money/stripe/payment/confirm'.addBaseURl();

  /// Two fa
  static String twoFaGetURL = '/user/profile/google-2fa/'.addBaseURl();
  static String twoFaSubmitURL =
      '/user/profile/google-2fa/status/update'.addBaseURl();
  static String twoFaOtoVerifyURL = '/user/google-2fa/otp/verify'.addBaseURl();

  /// Marketplace
  static String marketplaceListURL = '/user/marketplace'.addBaseURl();
  static String marketplaceTransactionsListURL =
      '/user/marketplace/transactions'.addBaseURl();
  static String marketplaceBuyURL = '/user/marketplace/buy'.addBaseURl();
  static String marketplaceBuyConfirmURL =
      '/user/marketplace/confirm'.addBaseURl();
  static String marketplaceEvidenceSubmitURL =
      '/user/marketplace/evidence/submit'.addBaseURl();

  /// Offer
  static String makeAnOfferURL = '/user/offer/submit'.addBaseURl();
  static String counterOfferURL = '/user/offer/counter/submit'.addBaseURl();
  static String getOfferListURL = '/user/offer'.addBaseURl();
  static String offerStatusURL = '/user/offer/status'.addBaseURl();
  static String buyOfferURL = '/user/offer/buy'.addBaseURl();
  static String offerConfirmURL = '/user/offer/confirm'.addBaseURl();
  static String offerSubmitURL = '/user/offer/evidence/submit'.addBaseURl();

  // fee calculator
  static String feeCalculatorURL = '/user/calculator'.addBaseURl();

  /// >> notification
  static String notificationURL = '/user/notification/list'.addBaseURl();

  //>>>>>>> money out
  static String withdrawInfoURL = '/user/withdraw/info'.addBaseURl();
  static String withdrawInsertURL = '/user/withdraw/insert'.addBaseURl();
  static String withdrawConfirmURL =
      '/user/withdraw/manual/confirmed'.addBaseURl();
  static String languagesURL = '/languages'.addBaseURl();
}
