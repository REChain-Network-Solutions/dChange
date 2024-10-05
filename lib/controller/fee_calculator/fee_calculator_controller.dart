import 'package:dchange/backend/services/fee_calculator/fee_calculator_api_service.dart';
import 'package:dchange/utils/basic_screen_imports.dart';

import '../../backend/model/fee_calculator/fee_calculator_info_model.dart';
import '../../backend/utils/api_method.dart';
import '../currency/currency_controller.dart';

class FeeCalculatorController extends GetxController {
  final currency = Get.put(CurrencyController());
  final amountController = TextEditingController();
  final feeController = TextEditingController();

  get onCalculateProcess => getTradeFeApiProcess();

  /// >> set loading process & Model
  final _isLoading = false.obs;
  late FeeCalculatorInfoModel _feeCalculatorInfoModel;

  /// >> get loading process & Model
  bool get isLoading => _isLoading.value;
  FeeCalculatorInfoModel get feeCalculatorInfoModel => _feeCalculatorInfoModel;

  ///* fee calculator api process
  Future<FeeCalculatorInfoModel> getTradeFeApiProcess() async {
    _isLoading.value = true;
    update();
    await FeeCalculatorApiServices.getFeeCalculatorApiProcess(
      amount: amountController.text,
      currency: currency.sellCurrencyId.value,
    ).then((value) {
      _feeCalculatorInfoModel = value!;
      feeController.text = _feeCalculatorInfoModel.data.fee;

      update();
    }).catchError((onError) {
      amountController.clear();
      feeController.clear();
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _feeCalculatorInfoModel;
  }
}
