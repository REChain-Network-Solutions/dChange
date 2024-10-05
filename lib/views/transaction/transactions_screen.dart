import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import '../../backend/model/marketplace/marketplace_transaction_model.dart';
import '../../controller/transaction/transaction_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/animations/custom_listview_animation.dart';
import '../../widgets/common/amount_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';
import '../../widgets/common/text_labels/title_heading5_widget.dart';

part '../../widgets/transaction/transaction_widget.dart';
part '../transaction/transaction_mobile_screen_layout.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});
  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: TransactionMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
