import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../controller/my_section/my_section_history_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/my_trade/my_trade_history_widget.dart';

part 'my_trade_history_mobile_screen_layout.dart';

class MyTradeHistoryScreen extends StatelessWidget {
  MyTradeHistoryScreen({super.key});
  final controller = Get.put(MyTradeHistoryController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MyTradeHistoryMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
