import 'package:dchange/controller/offer_buy/offer_buy_preview_controller.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

part 'offer_evidence_submit_mobile_screen_layout.dart';

class OfferEvidenceSubmitScreen extends StatelessWidget {
  OfferEvidenceSubmitScreen({super.key});
  final controller = Get.put(OfferBuyPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: OfferEvidenceMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
