import '../../controller/onboard/onbaord_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import 'onboard_mobile_screen_layout.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final controller = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: OnboardMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
