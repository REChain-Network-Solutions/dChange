import 'package:dchange/extensions/custom_extensions.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/my_trade/trade_edit_info_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/my_trade/my_trade_api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../currency/currency_controller.dart';

class TradeEditController extends GetxController {
  ///* put global currency controller
  final currency = Get.put(CurrencyController());

  /// >>> Exchange Rate
  RxDouble sellAmount = 0.0.obs;
  RxString sellCurrency = ''.obs;
  RxDouble rateAmount = 0.0.obs;
  RxString rateCurrency = ''.obs;

  /// >>> Text Editing Controller for start transaction
  final amountController = TextEditingController();
  final rateController = TextEditingController();

  get onUpdate => tardeUpdateApiProcess();

  /// >> set loading process & My Trade Info Model
  final _isLoading = false.obs;
  late TradeEditInfoModel _tradeEditInfoModel;

  /// >> get loading process & My Trade Info Model
  bool get isLoading => _isLoading.value;
  TradeEditInfoModel get tradeEditInfoModel => _tradeEditInfoModel;

  ///* Get trade info api process
  Future<TradeEditInfoModel> getTradeEditInfoProcess() async {
    _isLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'target': LocalStorage.getForexcrowID(),
    };
    await MyTradeApiServices.tradeEditInfoGetApi(body: inputBody).then((value) {
      _tradeEditInfoModel = value!;

      _setData(_tradeEditInfoModel);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _tradeEditInfoModel;
  }

  /// >> set loading process & Trade Close Model
  final _isCloseLoading = false.obs;
  late CommonSuccessModel _tradeCloseModel;

  /// >> get loading process & Trade Close Model
  bool get isCloseLoading => _isCloseLoading.value;
  CommonSuccessModel get tradeCloseModel => _tradeCloseModel;

  ///* Trade Close api process
  Future<CommonSuccessModel> tardeCloseApiProcess() async {
    _isCloseLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'target': LocalStorage.getTradeID(),
    };

    await MyTradeApiServices.myTradeCloseApi(body: inputBody).then((value) {
      _tradeCloseModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isCloseLoading.value = false;
    update();
    return _tradeCloseModel;
  }

  /// >> set loading process & Trade Update Model
  final _isUpdateLoading = false.obs;
  late CommonSuccessModel _tradeUpdateModel;

  /// >> get loading process & Trade Update Model
  bool get isUpdateLoading => _isUpdateLoading.value;
  CommonSuccessModel get tradeUpdateModel => _tradeUpdateModel;

  ///* Trade Update api process
  Future<CommonSuccessModel> tardeUpdateApiProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'target': LocalStorage.getForexcrowID(),
      'rate': rateController.text,
    };

    await MyTradeApiServices.myTradeUpdateApi(body: inputBody).then((value) {
      _tradeUpdateModel = value!;
      Routes.navigationScreen.offAllNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _tradeUpdateModel;
  }

  void _setData(TradeEditInfoModel tradeEditInfoModel) {
    var data = tradeEditInfoModel.data.trade;
    double rate = double.parse(data.saleCurrency.rate);
    sellAmount.value = double.parse(data.amount);
    sellCurrency.value = data.saleCurrency.code;

    rateAmount.value = (1 / rate);
    rateCurrency.value = data.rateCurrency.code;

    amountController.text = data.amount;
    rateController.text = data.rate;

    Routes.tradeEditScreen.toNamed;
  }
}
