import 'dart:io';

import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter/services.dart';

import '../../backend/model/add_money/add_money_info_model.dart';
import '../../controller/add_money/add_money_controller.dart';
import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/custom_drop_down/custom_drop_down.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part 'add_money_mobile_screen_layout.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({super.key});

  final controller = Get.put(AddMoneyController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AddMoneyMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
