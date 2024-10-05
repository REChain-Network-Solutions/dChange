import '../../controller/add_money/add_money_preview_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/add_money_and_money_out/custom_preview_widget.dart';

part 'add_money_preview_mobile_screen_layout.dart';

class AddMoneyPreviewScreen extends StatelessWidget {
  AddMoneyPreviewScreen({super.key});

  final controller = Get.put(AddMoneyPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: AddMoneyPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
