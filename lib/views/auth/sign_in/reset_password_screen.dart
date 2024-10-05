import 'package:dchange/backend/utils/custom_loading_api.dart';

import '../../../controller/auth/sign_in/reset_password_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/inputs/primary_input_widget.dart';

part '../sign_in/reset_password_mobile_screen_layout.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ResetPasswordMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
