import 'package:dchange/backend/utils/custom_loading_api.dart';

import '../../controller/my_wallet/my_wallet_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import '../../widgets/my_wallet/my_wallet_currency_widget.dart';

part 'my_wallet_mobile_screen_layout.dart';

class MyWalletScreen extends StatelessWidget {
  MyWalletScreen({super.key});
  final controller = Get.put(MyWalletController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: MyWalletMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
