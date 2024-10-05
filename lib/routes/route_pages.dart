part of '../routes/routes.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.emailVerificationScreen,
      page: () => EmailVerificationScreen(),
    ),

    /// Navigation
    GetPage(
        name: Routes.navigationScreen,
        page: () => NavigationScreen(),
        binding: InitialScreenBindings()),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.marketplaceBuyingPreviewScreen,
      page: () => MarketplaceBuyingPreviewScreen(),
    ),
    GetPage(
      name: Routes.marketplaceBuyingPreviewScreen,
      page: () => MarketplaceBuyingPreviewScreen(),
    ),
    GetPage(
      name: Routes.sellingPreviewScreen,
      page: () => SellingPreviewScreen(),
    ),
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => UpdateProfileScreen(),
    ),
    GetPage(
      name: Routes.feeCalculatorScreen,
      page: () => FeeCalculatorScreen(),
    ),
    GetPage(
      name: Routes.getOfferScreen,
      page: () => GetOfferScreen(),
    ),
    GetPage(
      name: Routes.mySectionHistoryScreen,
      page: () => MyTradeHistoryScreen(),
    ),
    GetPage(
      name: Routes.transactionScreen,
      page: () => TransactionScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.twoFaVerificationScreen,
      page: () => TwoFaVerificationScreen(),
    ),
    GetPage(
      name: Routes.historyScreen,
      page: () => HistoryScreen(),
    ),
    GetPage(
      name: Routes.makeAnOfferBuyingPreviewScreen,
      page: () => MakeAnOfferBuyingPreviewScreen(),
    ),
    GetPage(
      name: Routes.makeCounterOfferScreen,
      page: () => MakeCounterOfferScreen(),
    ),
    GetPage(
      name: Routes.myWalletScreen,
      page: () => MyWalletScreen(),
    ),
    GetPage(
      name: Routes.addMoneyScreen,
      page: () => AddMoneyScreen(),
    ),

    GetPage(
      name: Routes.addMoneyPreviewScreen,
      page: () => AddMoneyPreviewScreen(),
    ),
    GetPage(
      name: Routes.moneyOutScreen,
      page: () => MoneyOutScreen(),
    ),
    GetPage(
      name: Routes.moneyOutPreviewScreen,
      page: () => const MoneyOutPreviewScreen(),
    ),
    GetPage(
      name: Routes.identityVerificationScreen,
      page: () => IdentityVerificationScreen(),
    ),
    GetPage(
      name: Routes.adCreateSuccessfullyScreen,
      page: () => AdCreateSuccessScreen(),
    ),

    GetPage(
      name: Routes.paypalWebPaymentScreen,
      page: () => PaypalWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.flutterWaveWebPaymentScreen,
      page: () => FlutterWaveWebPaymentScreen(),
    ),

    GetPage(
      name: Routes.twoFaOtpVerificationScreen,
      page: () => TwoFaOtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.addMoneyManualPaymentScreen,
      page: () => AddMoneyManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.tradeEditScreen,
      page: () => TradeEditScreen(),
    ),
    GetPage(
      name: Routes.marketplaceEvidenceSubmitScreen,
      page: () => MarketplaceEvidenceSubmitScreen(),
    ),
    GetPage(
      name: Routes.offerBuyPreviewScreen,
      page: () => OfferBuyPreviewScreen(),
    ),
    GetPage(
      name: Routes.offerEvidenceSubmitScreen,
      page: () => OfferEvidenceSubmitScreen(),
    ),
    GetPage(
      name: Routes.filterItemsScreen,
      page: () => FilterItemsScreen(),
    ),
    GetPage(
      name: Routes.stripeWebPaymentScreen,
      page: () => StripeWebPaymentScreen(),
    ),
    GetPage(
      name: Routes.moneyOutManualPaymentScreen,
      page: () => MoneyOutManualPaymentScreen(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: Routes.tatumPaymentScreen,
      page: () => TatumPaymentScreen(),
    ),
  ];
}
