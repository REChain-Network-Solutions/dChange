import 'package:dchange/views/auth/sign_in/sign_in_screen.dart';
import 'package:dchange/views/settings/settings.dart';
import 'package:get/get.dart';

import '../bindings/initial_bindings.dart';
import '../bindings/splash_screen_binding.dart';
import '../views/add_money/add_money_manual_payment_screen.dart';
import '../views/add_money/add_money_preview_screen.dart';
import '../views/add_money/add_money_screen.dart';
import '../views/add_money/flutterwave_web_payment_screen.dart';
import '../views/add_money/paypal_web_payment_screen.dart';
import '../views/add_money/stripe_web_view_screen.dart';
import '../views/add_money/tatum_payment_screen.dart';
import '../views/auth/sign_in/otp_verification_screen.dart';
import '../views/auth/sign_in/reset_password_screen.dart';
import '../views/auth/sign_in/two_fa_verification_screen.dart';
import '../views/auth/sign_up/email_verification_screen.dart';
import '../views/auth/sign_up/sign_up_screen.dart';
import '../views/change_password/change_password_screen.dart';
import '../views/fee_calculator/fee_calculator_screen.dart';
import '../views/get_offer/get_offer_screen.dart';
import '../views/history/history_screen.dart';
import '../views/identity_verification/identity_verification_screen.dart';
import '../views/make_an_offer/make_an_offer_buying_preview_screen.dart';
import '../views/make_counter_offer/make_counter_screen.dart';
import '../views/marketplace/filter_items_screen.dart';
import '../views/marketplace/marketplace_buying_preview_screen.dart';
import '../views/marketplace/marketplace_evidence_submit_screen.dart';
import '../views/money_out/moeny_out_manual_payment_screen.dart';
import '../views/money_out/money_out_preview_screen.dart';
import '../views/money_out/money_out_screen.dart';
import '../views/my_section/ad_create_success_screen.dart';
import '../views/my_section/my_selling_preview_screen.dart';
import '../views/my_section/my_trade_edit_screen.dart';
import '../views/my_section/my_trade_history_screen.dart';
import '../views/my_wallet/my_wallet_screen.dart';
import '../views/navigation/navigation_screen.dart';
import '../views/offer_buy/offer_buy_preview_screen.dart';
import '../views/offer_buy/offer_evidence_submit_screen.dart';
import '../views/onboard/onboard_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/profile/update_profile_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/transaction/transactions_screen.dart';
import '../views/two_fa_verification/two_fa_verification_screen.dart';

part '../routes/route_pages.dart';

class Routes {
  // Page List
  static var list = RoutePageList.list;

  // Route Names
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboard_screen';
  static const String signInScreen = '/sign_in_screen';
  static const String twoFaOtpVerificationScreen =
      '/twoFaOtpVerificationScreen';
  static const String otpVerificationScreen = '/otp_verification_screen';
  static const String resetPasswordScreen = '/reset_password_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String emailVerificationScreen = '/email_verification_screen';
  static const String confirmationScreen = '/confirmation_screen';
  static const String profileScreen = '/profile_screen';
  static const String navigationScreen = '/navigationScreen';
  static const String marketplaceBuyingPreviewScreen =
      '/marketplaceBuyingPreviewScreen';
  static const String sellingPreviewScreen = '/sellingPreviewScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String feeCalculatorScreen = '/feeCalculatorScreen';
  static const String getOfferScreen = '/getOfferScreen';
  static const String mySectionHistoryScreen = '/mySectionHistoryScreen';
  static const String transactionScreen = '/transactionScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String twoFaVerificationScreen = '/twoFaVerificationScreen';
  static const String historyScreen = '/historyScreen';
  static const String makeAnOfferBuyingPreviewScreen =
      '/makeAnOfferBuyingPreviewScreen';
  static const String makeCounterOfferScreen = '/makeCounterOfferScreen';
  static const String myWalletScreen = '/myWalletScreen';
  static const String addMoneyScreen = '/addMoneyScreen';
  static const String addMoneyPreviewScreen = '/addMoneyPreviewScreen';
  static const String moneyOutScreen = '/moneyOutScreen';
  static const String moneyOutPreviewScreen = '/moneyOutPreviewScreen';
  static const String identityVerificationScreen =
      '/identityVerificationScreen';
  static const String adCreateSuccessfullyScreen =
      '/adCreateSuccessfullyScreen';
  static const String marketplaceEvidenceSubmitScreen =
      '/marketplaceEvidenceSubmitScreen';
  static const String filterItemsScreen = '/filterItemsScreen';

  //add money
  static const String paypalWebPaymentScreen = '/paypalWebPaymentScreen';
  static const String stripeWebPaymentScreen = '/stripeWebPaymentScreen';
  static const String tatumPaymentScreen = '/tatumPaymentScreen';
  static const String flutterWaveWebPaymentScreen =
      '/flutterWaveWebPaymentScreen';
  static const String addMoneyStripeAnimatedScreen =
      '/addMoneyStripeAnimatedScreen';
  static const String addMoneyManualPaymentScreen =
      '/addMoneyManualPaymentScreen';

  //Trade
  static const String tradeEditScreen = '/tradeEditScreen';
// money out

  static const String moneyOutManualPaymentScreen =
      '/moneyOutManualPaymentScreen';

  /// offer
  static const String offerBuyPreviewScreen = '/offerBuyPreviewScreen';
  static const String offerEvidenceSubmitScreen = '/offerEvidenceSubmitScreen';
}
