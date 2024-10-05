import 'dart:ui';

import 'package:dchange/language/language_controller.dart';
import 'package:dchange/views/drawer/drawer_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../controller/marketplace/marketplace_controller.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/app_basic_logo.dart';
import '../../widgets/common/currency/currency_drop_down.dart';
import '../../widgets/common/others/custom_image_widget.dart';

part '../navigation/navigation_mobile_layout_screen.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: NavigationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
