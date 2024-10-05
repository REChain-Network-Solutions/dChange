import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/auth/sign_in/otp_verification_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/title_sub_title_widget.dart';

part '../sign_in/otp_verification_mobile_screen_layout.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final controller = Get.put(OtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: OtpVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
