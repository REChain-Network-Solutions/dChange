import 'package:dchange/backend/model/my_trade/trade_submit_model.dart';
import 'package:dchange/backend/services/my_trade/my_trade_api_services.dart';
import 'package:dchange/utils/basic_screen_imports.dart';

import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';
import '../currency/currency_controller.dart';
import 'my_selling_preview_controller.dart';

class MySectionController extends GetxController {
  ///* put global currency controller
  final currency = Get.put(CurrencyController());

  /// >>> Exchange Rate
  RxInt sellAmount = 1.obs;
  RxString sellCurrency = ''.obs;
  RxDouble rateAmount = 0.0.obs;
  RxString rateCurrency = ''.obs;

  /// >>>  Trade min max rate
  RxString tardeMin = ''.obs;
  RxString tardeMax = ''.obs;

  /// >>> Text Editing Controller for start transaction
  final amountController = TextEditingController();
  final rateController = TextEditingController();

  /// >>> Transaction process
  get onProceed => tardeSubmitApiProcess();

  /// >> set loading process & Trade Submit Model
  final _isLoading = false.obs;
  late TradeSubmitModel _tradeSubmitModel;

  /// >> get loading process & Trade Submit Model
  bool get isLoading => _isLoading.value;
  TradeSubmitModel get tradeSubmitModel => _tradeSubmitModel;

  ///* Trade submit api process
  Future<TradeSubmitModel> tardeSubmitApiProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'currency': currency.sellCurrencyId.value,
      'rate_currency': currency.rateCurrencyId.value,
      'amount': amountController.text,
      'rate': rateController.text,
    };

    await MyTradeApiServices.myTradeSubmitApi(body: inputBody).then((value) {
      _tradeSubmitModel = value!;
      _setPreviewData(_tradeSubmitModel);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _tradeSubmitModel;
  }

  void _setPreviewData(TradeSubmitModel tradeSubmitModel) {
    final controller = Get.put(MySellingPreviewController());
    DataData data = tradeSubmitModel.data.data;
    controller.sellAmount.value = double.parse(data.amount);
    controller.sellCurrency.value = data.saleCurrencyCode;
    controller.rateAmount.value = double.parse(data.rate);
    controller.rateCurrency.value = data.rateCurrencyCode;
    controller.subTotal.value = data.subtotal.toStringAsFixed(2);
    controller.charge.value = data.totalCharge.toStringAsFixed(2);
    controller.total.value = data.totalAmount.toStringAsFixed(2);
    controller.payableAmount.value = data.totalAmount.toStringAsFixed(2);
    controller.trxId.value = tradeSubmitModel.data.trxId;
    Get.toNamed(Routes.sellingPreviewScreen);
  }
}
