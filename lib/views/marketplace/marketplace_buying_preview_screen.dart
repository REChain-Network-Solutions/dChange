import 'package:dchange/controller/marketplace/marketplace_buying_preview_controller.dart';

import '../../backend/model/marketplace/marketplace_buy_model.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/amount_widget.dart';
import '../../widgets/common/appbar/back_button.dart';
import '../../widgets/common/custom_drop_down/custom_drop_down.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/separate_double_text_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/marketplace/marketplace_payment_details_widget.dart';
part '../../widgets/marketplace/marketplace_rate_with_gateway_widget.dart';
part '../marketplace/marketplace_buying_preview_mobile_screen_layout.dart';

class MarketplaceBuyingPreviewScreen extends StatelessWidget {
  MarketplaceBuyingPreviewScreen({super.key});
  final controller = Get.put(MarketplaceBuyingPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MarketplaceBuyingPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
