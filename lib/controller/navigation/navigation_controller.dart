import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_widget_imports.dart';
import 'package:dchange/views/marketplace/marketplace_screen.dart';
import 'package:dchange/views/notification/notification_screen.dart';

import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/auth/auth_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';
import '../../views/home/home_screen.dart';
import '../../views/my_section/my_section_screen.dart';
import '../../views/web_view/web_view_screen.dart';
import '../basic_settings/basic_settings_controller.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final basicSettingsController = Get.put(BasicSettingsController());

  final List page = [
    HomeScreen(),
    MarketplaceScreen(),
    MySectionScreen(),
    NotificationScreen(),
  ];

  get onProfile => Routes.profileScreen.toNamed;
  get onIdentityVerification => Routes.identityVerificationScreen.toNamed;

  void selectedPage(int index) {
    selectedIndex.value = index;
  }

  get onTransaction => Routes.transactionScreen.toNamed;
  get onSettings => Routes.settingsScreen.toNamed;
  get onChangePassword => Routes.changePasswordScreen.toNamed;
  get onTwoFaVerification => Routes.twoFaVerificationScreen.toNamed;
  get onHelpCenter => Get.to(
        () => WebViewScreen(
          title: Strings.helpCenter,
          url: basicSettingsController.contactUs.value,
        ),
      );

  get onAboutUs => Get.to(
        () => WebViewScreen(
          title: Strings.aboutUs,
          url: basicSettingsController.aboutUs.value,
        ),
      );

  get onPrivacyAndPolicy => Get.to(
        () => WebViewScreen(
          title: Strings.privacyAndPolicy,
          url: basicSettingsController.privacyPolicy.value,
        ),
      );

  /// >> set loading process & model
  final _isLoading = false.obs;
  late CommonSuccessModel _signOutModel;

  /// >> get loading process & model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get signOutModel => _signOutModel;

  ///* Sign out process
  Future<CommonSuccessModel> signOutProcess() async {
    _isLoading.value = true;
    update();

    await AuthApiServices.signOutProcessApi().then((value) {
      _signOutModel = value!;
      _whenSignOutCompleted();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signOutModel;
  }

  void _whenSignOutCompleted() {
    LocalStorage.signOut();
    Get.offNamedUntil(Routes.signInScreen, (route) => false);
  }
}
