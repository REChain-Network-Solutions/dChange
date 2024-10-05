import 'package:dchange/extensions/custom_extensions.dart';
import 'package:get/get.dart';

import '../../backend/model/currency/currency_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/currency/currency_api_service.dart';
import '../my_section/my_section_controller.dart';

class CurrencyController extends GetxController {
  RxString sellCurrency = ''.obs;
  RxString rateCurrency = ''.obs;
  RxString sellCurrencyId = ''.obs;
  RxString rateCurrencyId = ''.obs;

  /// >>> set variable for get flag image
  RxString flagImagePath = ''.obs;

  @override
  void onInit() {
    getCurrencyApiProcess();
    super.onInit();
  }

  /// >> set loading process & Currency Model
  final _isLoading = false.obs;
  late CurrencyModel _currencyModel;

  /// >> get loading process & Currency Model
  bool get isLoading => _isLoading.value;
  CurrencyModel get currencyModel => _currencyModel;

  ///* Get currency api process
  Future<CurrencyModel> getCurrencyApiProcess() async {
    _isLoading.value = true;
    update();

    await CurrencyApiServices.getCurrencyProcessApi().then((value) {
      _currencyModel = value!;
      sellCurrency.value = _currencyModel.data.saleCurrency.first.code;
      rateCurrency.value = _currencyModel.data.rateCurrency.first.code;
      sellCurrencyId.value =
          _currencyModel.data.saleCurrency.first.id.toString();
      rateCurrencyId.value =
          _currencyModel.data.rateCurrency.first.id.toString();
      _setTradeMinMaxRate();

      if (_currencyModel.data.wallet.flag != "") {
        flagImagePath.value =
            "${_currencyModel.data.baseUrl}/${_currencyModel.data.imagePath}/${_currencyModel.data.wallet.flag}";
      } else {
        flagImagePath.value =
            "${_currencyModel.data.baseUrl}/${_currencyModel.data.defaultImage}";
      }

      _setDataForTradeExchangeRate();

      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _currencyModel;
  }

  void _setDataForTradeExchangeRate() {
    final tradeController = Get.put(MySectionController());
    tradeController.sellCurrency.value =
        _currencyModel.data.saleCurrency.first.code;
    tradeController.rateCurrency.value =
        _currencyModel.data.rateCurrency.first.code;
    double sellCurrencyRate =
        double.parse(_currencyModel.data.saleCurrency.first.rate);
    tradeController.rateAmount.value = (1.00 / sellCurrencyRate);
  }

  void _setTradeMinMaxRate() {
    final tradeController = Get.put(MySectionController());
    double sellCurrencyRate =
        double.parse(_currencyModel.data.saleCurrency.first.rate);
    double minTrade = _currencyModel.data.tradeInfo.minLimit.toDouble;
    double maxTrade = _currencyModel.data.tradeInfo.maxLimit.toDouble;
    tradeController.tardeMin.value = (minTrade * sellCurrencyRate).toString();
    tradeController.tardeMax.value = (maxTrade * sellCurrencyRate).toString();
  }

  updateMinMaxRate(double sellCurrencyRate) {
    final tradeController = Get.put(MySectionController());
    double minTrade = _currencyModel.data.tradeInfo.minLimit.toDouble;
    double maxTrade = _currencyModel.data.tradeInfo.maxLimit.toDouble;
    tradeController.tardeMin.value = (minTrade * sellCurrencyRate).toString();
    tradeController.tardeMax.value = (maxTrade * sellCurrencyRate).toString();
  }
}
