import '../../backend/utils/custom_loading_api.dart';
import '../../controller/my_section/tarde_edit_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/my_trade/exchange_rate_input_field_widget.dart';

part 'my_trade_edit_mobile_screen_layout.dart';

class TradeEditScreen extends StatelessWidget {
  TradeEditScreen({super.key});
  final controller = Get.put(TradeEditController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TradeEditMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
