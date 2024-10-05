import 'package:dchange/backend/utils/custom_loading_api.dart';

import '../../controller/two_fa_verification/two_fa_verification_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/title_sub_title_widget.dart';

part '../two_fa_verification/two_fa_verification_mobile_screen_layout.dart';

class TwoFaVerificationScreen extends StatelessWidget {
  TwoFaVerificationScreen({super.key});
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
