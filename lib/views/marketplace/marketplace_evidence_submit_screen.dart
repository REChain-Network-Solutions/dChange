import 'package:dchange/controller/marketplace/marketplace_buying_preview_controller.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

part 'marketplace_evidence_submit_mobile_screen_layout.dart';

class MarketplaceEvidenceSubmitScreen extends StatelessWidget {
  MarketplaceEvidenceSubmitScreen({super.key});
  final controller = Get.put(MarketplaceBuyingPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MarketplaceEvidenceMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
