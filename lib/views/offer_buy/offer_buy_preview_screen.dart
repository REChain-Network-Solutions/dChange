import '../../controller/offer_buy/offer_buy_preview_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/appbar/back_button.dart';
import '../../widgets/offer_buy/offer_payment_details_widget.dart';
import '../../widgets/offer_buy/offer_rate_with_gateway_widget.dart';

part 'offer_buy_preview_mobile_screen_layout.dart';

class OfferBuyPreviewScreen extends StatelessWidget {
  OfferBuyPreviewScreen({super.key});
  final controller = Get.put(OfferBuyPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: OfferBuyPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
