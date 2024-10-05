import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/backend/model/my_trade/trade_confirm_model.dart';
import 'package:dchange/backend/services/my_trade/my_trade_api_services.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_screen_imports.dart';

import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';
import 'ad_create_success_controller.dart';

class MySellingPreviewController extends GetxController {
  /// >>> Rate
  RxDouble sellAmount = 0.0.obs;
  RxString sellCurrency = ''.obs;
  RxDouble rateAmount = 0.0.obs;
  RxString rateCurrency = ''.obs;

  /// >>> set value for payment method
  RxString selectPaymentGateway = 'Paypal'.obs;

  /// >>>  user info edit process
  get onUserInfoEdit => Routes.updateProfileScreen.toNamed;

  /// >>>  payment gateway edit process
  get onPaymentGatewayEdit => '';

  /// >>> Your Details
  RxString fullName = LocalStorage.getName().obs;
  RxString emailAddress = LocalStorage.getEmail().obs;
  RxString phoneNumber = LocalStorage.getNumber().obs;

  /// >>> Transactions Summary
  RxString subTotal = ''.obs;
  RxString charge = ''.obs;
  RxString total = ''.obs;
  RxString payableAmount = ''.obs;

  /// >>> get trx id for confirm your transaction
  RxString trxId = ''.obs;

  /// >>>  on confirm
  get onConfirm => myTradeConfirmApiProcess();

  /// >> set loading process & Trade Confirm Model
  final _isLoading = false.obs;
  late TradeConfirmModel _tradeConfirmModel;

  /// >> get loading process & Trade Confirm Model
  bool get isLoading => _isLoading.value;
  TradeConfirmModel get tradeConfirmModel => _tradeConfirmModel;

  ///* My trade confirm api process
  Future<TradeConfirmModel> myTradeConfirmApiProcess() async {
    _isLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'trx_id': trxId.value,
    };

    await MyTradeApiServices.myTradeConfirmApi(
      body: inputBody,
    ).then((value) {
      _tradeConfirmModel = value!;
      _setDataForQrCode(_tradeConfirmModel);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _tradeConfirmModel;
  }

  void _setDataForQrCode(TradeConfirmModel tradeConfirmModel) {
    final controller = Get.put(AdCreateSuccessController());
    controller.qrCode.value = tradeConfirmModel.data.qrcode;
    controller.adId.value = tradeConfirmModel.data.id.toString();
    controller.url.value = tradeConfirmModel.data.url;
    Routes.adCreateSuccessfullyScreen.toNamed;
  }
}
