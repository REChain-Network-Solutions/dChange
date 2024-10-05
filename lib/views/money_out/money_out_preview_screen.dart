import '../../controller/money_out/money_out_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/withdraw/money_out_preview.dart';

part 'money_out_preview_mobile_screen_layout.dart';

class MoneyOutPreviewScreen extends StatelessWidget {
  const MoneyOutPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MoneyOutPreviewMobileScreenLayout(),
    );
  }
}
