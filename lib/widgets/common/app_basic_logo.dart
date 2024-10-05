import 'package:flutter/material.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';

class AppBasicLogo extends StatelessWidget {
  final double scale;
  const AppBasicLogo({super.key, this.scale = 16});

  @override
  Widget build(BuildContext context) {
    // final basicSettingsController = Get.put(BasicSettingsController());
    return Image.asset(
      Assets.logo.basicLogo.path,
      scale: scale,
    );
  }
}
