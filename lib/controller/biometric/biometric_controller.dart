// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../routes/routes.dart';

class BiometricController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;

  @override
  void onInit() async {
    auth.isDeviceSupported().then(
          (bool isSupported) => supportState =
              isSupported ? SupportState.supported : SupportState.unsupported,
        );
    if (LocalStorage.isLoggedIn()) {
      bool isAuthenticated = await Authentication.authenticateWithBiometrics();

      if (isAuthenticated) {
        Get.offAndToNamed(Routes.navigationScreen);
      } else {
        debugPrint('isAuthenticated : false');
      }
    }
    super.onInit();
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class Authentication {
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Please complete the biometrics to proceed.',
      );
    }

    return isAuthenticated;
  }
}
