import 'dart:ui';

import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/custom_assets/assets.gen.dart';
import 'package:flutter/gestures.dart';

import '../../../backend/local_storage/local_storage.dart';
import '../../../controller/auth/sign_in/sign_in_controller.dart';
import '../../../controller/biometric/biometric_controller.dart';
import '../../../language/language_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/app_basic_logo.dart';
import '../../../widgets/common/inputs/primary_input_widget.dart';
import '../../../widgets/common/text_labels/title_heading5_widget.dart';
import '../../../widgets/common/title_sub_title_widget.dart';

part '../sign_in/sign_in_mobile_screen_layout.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SignIndMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
