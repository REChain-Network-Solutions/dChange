import 'dart:async';

import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:uni_links/uni_links.dart';

import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../deep_link/deep_link_controller.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
      const Duration(seconds: 5),
      () {
        initUniLinks();
        Get.offAllNamed(
          LocalStorage.isLoggedIn()
              ? Routes.signInScreen
              : LocalStorage.isOnBoardDone()
                  ? Routes.signInScreen
                  : Routes.onboardScreen,
        );
      },
    );
  }

  void initUniLinks() async {
    Uri? initialUri = await getInitialUri(); // Use Uri? here
    if (initialUri != null) {
      // Handle the initial deep link here
      // You can navigate to a specific screen or perform an action
      handleDeepLink(initialUri);
    }

    // Use Uri? in the function parameter
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        handleDeepLink(uri);
        debugPrint(uri.toString());
      }
    }, onError: (Object err) {
      // Handle any errors that occur during deep link handling
      debugPrint(err.toString());
    });
  }

  void handleDeepLink(Uri uri) {
    final deepLinkController = Get.put(DeepLinkController());
    deepLinkController.handleDeepLink(uri);
  }
}
