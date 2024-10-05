import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/auth/sign_up/email_verification_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/title_sub_title_widget.dart';

part '../sign_up/email_verification_mobile_screen_layout.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final controller = Get.put(EmailVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: EmailVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
