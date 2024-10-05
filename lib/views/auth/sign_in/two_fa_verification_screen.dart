import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/auth/sign_in/two_fa_verification_controller.dart';
import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/common/title_sub_title_widget.dart';

part 'two_fa_verification_mobile_screen_layout.dart';

class TwoFaOtpVerificationScreen extends StatelessWidget {
  TwoFaOtpVerificationScreen({super.key});
  final controller = Get.put(TwoFaVerificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TwoFaVerificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
