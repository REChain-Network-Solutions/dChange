import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/custom_assets/assets.gen.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../backend/model/marketplace/marketplace_info_model.dart';
import '../../controller/currency/currency_controller.dart';
import '../../controller/get_offer/get_offer_controller.dart';
import '../../controller/home/home_controller.dart';
import '../../controller/marketplace/marketplace_controller.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';
import '../get_offer/get_offer_screen.dart';

part '../home/home_mobile_screen_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: HomeMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
