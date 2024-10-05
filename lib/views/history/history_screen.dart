import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../backend/model/add_money/add_money_info_model.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/add_money/add_money_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/text_labels/extend_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/history/history_widget.dart';
part '../history/history_mobile_screen_layout.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});
  final controller = Get.put(AddMoneyController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HistoryMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
