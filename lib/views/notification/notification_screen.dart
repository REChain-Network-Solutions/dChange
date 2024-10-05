import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../backend/model/notification/notification_info_model.dart';
import '../../controller/notification/notification_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/notifications/notification_widget.dart';
part '../notification/notification_mobile_screen_layout.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: NotificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
