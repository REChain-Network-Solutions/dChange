import '../../controller/change_password/change_password_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';

part '../../widgets/change_password/change_password_fields_widget.dart';
part '../change_password/change_password_mobile_screen_layout.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ChangePasswordMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
