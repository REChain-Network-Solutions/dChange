import 'package:dchange/controller/add_money/add_money_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/routes/routes.dart';
import 'package:get/get.dart';

class MyWalletController extends GetxController {
  final controller = Get.put(AddMoneyController());
  get onTransactionViewAll => Routes.historyScreen.toNamed;

  get onAddMoney => Routes.addMoneyScreen.toNamed;

  get onMoneyOut => Routes.moneyOutScreen.toNamed;

  get onHistory => Routes.historyScreen.toNamed;
}
