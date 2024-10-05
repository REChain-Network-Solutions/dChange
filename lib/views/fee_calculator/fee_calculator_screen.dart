import 'package:flutter/services.dart';

import '../../controller/fee_calculator/fee_calculator_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/currency/currency_drop_down.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../fee_calculator/fee_calculator_mobile_screen_layout.dart';

class FeeCalculatorScreen extends StatelessWidget {
  FeeCalculatorScreen({super.key});
  final controller = Get.put(FeeCalculatorController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: FeeCalculatorMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
