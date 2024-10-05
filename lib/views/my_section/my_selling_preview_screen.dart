import 'package:dchange/controller/my_section/my_selling_preview_controller.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/common/amount_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/separate_double_text_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/my_trade/selling_payment_details_widget.dart';
part '../../widgets/my_trade/selling_rate_with_gateway_widget.dart';
part '../my_section/my_selling_preview_mobile_screen_layout.dart';

class SellingPreviewScreen extends StatelessWidget {
  SellingPreviewScreen({super.key});
  final controller = Get.put(MySellingPreviewController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: SellingPreviewMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
