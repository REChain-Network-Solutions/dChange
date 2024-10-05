import 'package:flutter/services.dart';

import '../../controller/my_section/my_section_controller.dart';
import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/amount_widget.dart';
import '../../widgets/common/currency/currency_drop_down.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/my_trade/exchange_rate_widget.dart';
part '../../widgets/my_trade/my_trade_field_widget.dart';
part '../my_section/my_section_mobile_screen_layout.dart';

class MySectionScreen extends StatelessWidget {
  MySectionScreen({super.key});
  final controller = Get.put(MySectionController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MySectionMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
