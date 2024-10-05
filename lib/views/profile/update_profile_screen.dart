import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/controller/profile/update_profile_controller.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/image_picker_sheet.dart';
import '../../widgets/common/image_picker_widget.dart';
import '../../widgets/common/inputs/country_picker_input_widget.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/profile/update_profile_fields_widget.dart';
part '../../widgets/profile/update_profile_info_widget.dart';
part '../profile/update_profile_mobile_screen_layout.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  final controller = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: UpdateProfileMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
