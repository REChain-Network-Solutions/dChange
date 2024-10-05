import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../controller/marketplace/marketplace_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/marketplace/marketplace_widget.dart';

part '../marketplace/marketplace_mobile_screen_layout.dart';

class MarketplaceScreen extends StatelessWidget {
  MarketplaceScreen({super.key});
  final controller = Get.put(MarketplaceController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MarketplaceMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
