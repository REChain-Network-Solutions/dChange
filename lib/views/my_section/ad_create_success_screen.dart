import 'dart:io';
import 'dart:ui' as ui;

import 'package:dchange/backend/utils/custom_snackbar.dart';
import 'package:dchange/custom_assets/assets.gen.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../controller/my_section/ad_create_success_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/title_sub_title_widget.dart';

part 'ad_create_success_mobile_screen_layout.dart';

class AdCreateSuccessScreen extends StatelessWidget {
  AdCreateSuccessScreen({super.key});

  final controller = Get.put(AdCreateSuccessController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AdCreateSuccessMobileScreenLayout(controller: controller),
    );
  }
}
