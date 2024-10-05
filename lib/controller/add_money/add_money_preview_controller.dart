import 'package:dchange/controller/add_money/add_money_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';

class AddMoneyPreviewController extends GetxController {
  final transactionController = Get.put(AddMoneyController());
  final controller = Get.put(AddMoneyController());

  get onConfirm => _onConfirm();

  _onConfirm() {
    if (transactionController.selectedCurrencyType.value
        .contains("AUTOMATIC")) {
      if (transactionController.selectAlias.contains('stripe')) {
        Routes.addMoneyStripeAnimatedScreen.toNamed;
      } else if (transactionController.selectAlias.contains('flutterwave')) {
        Routes.flutterWaveWebPaymentScreen.toNamed;
      } else if (transactionController.selectAlias.contains('tatum')) {
        Routes.tatumPaymentScreen.toNamed;
      } else {
        Routes.paypalWebPaymentScreen.toNamed;
      }
    } else {
      controller.manualPaymentProcess();
    }
  }
}
