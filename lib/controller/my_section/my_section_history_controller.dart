import 'package:get/get.dart';

import '../../backend/model/my_trade/trade_info_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/my_trade/my_trade_api_services.dart';

class MyTradeHistoryController extends GetxController {
  @override
  void onInit() {
    getTradeInfoProcess();
    super.onInit();
  }

  /// >> set loading process & My Trade Info Model
  final _isLoading = false.obs;
  late MyTradeInfoModel _myTradeInfoModel;

  /// >> get loading process & My Trade Info Model
  bool get isLoading => _isLoading.value;
  MyTradeInfoModel get myTradeInfoModel => _myTradeInfoModel;

  ///* Get trade info api process
  Future<MyTradeInfoModel> getTradeInfoProcess() async {
    _isLoading.value = true;
    update();

    await MyTradeApiServices.myTradeGetApi().then((value) {
      _myTradeInfoModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _myTradeInfoModel;
  }
}
