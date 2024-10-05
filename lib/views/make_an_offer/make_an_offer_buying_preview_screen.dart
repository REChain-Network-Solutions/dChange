import '../../controller/make_an_offer/make_an_offer_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/amount_widget.dart';
import '../../widgets/common/appbar/back_button.dart';
import '../../widgets/common/inputs/primary_input_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/make_an_offer/make_an_offer_fields_widget.dart';
part '../../widgets/make_an_offer/make_an_offer_rate_widget.dart';
part 'make_an_offer_mobile_screen_layout.dart';

class MakeAnOfferBuyingPreviewScreen extends StatelessWidget {
  MakeAnOfferBuyingPreviewScreen({super.key});
  final controller = Get.put(MakeAnOfferController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MakeAnOfferPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
