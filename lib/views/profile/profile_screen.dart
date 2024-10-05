import 'package:flutter_animate/flutter_animate.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../controller/profile/profile_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/image_picker_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';

part '../../widgets/profile/profile_info_widget.dart';
part '../../widgets/profile/profile_topics_widget.dart';
part '../profile/profile_mobile_screen_layout.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: ProfileMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
