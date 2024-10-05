import 'dart:io';

import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/controller/money_out/money_out_controller.dart';
import 'package:flutter/services.dart';

import '../../backend/model/money_out/money_out_info_model.dart';
import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/custom_drop_down/custom_drop_down.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part 'money_out_mobile_screen_layout.dart';

class MoneyOutScreen extends StatelessWidget {
  MoneyOutScreen({super.key});

  final controller = Get.put(MoneyOutController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MoneyOuMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
