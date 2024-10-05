import '../../backend/model/common/common_success_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/offer/offer_api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_widget_imports.dart';
import '../../views/congratulation/congratulation_screen.dart';

class MakeAnOfferController extends GetxController {
  /// >>> Exchange Rate
  RxDouble sellAmount = 0.0.obs;
  RxString sellCurrency = ''.obs;
  RxDouble rateAmount = 0.0.obs;
  RxString rateCurrency = ''.obs;

  /// >>> get seller information
  RxString sellerName = ''.obs;
  RxBool isVerified = false.obs;

  /// >>> get trade id for make an offer
  RxString tradeId = ''.obs;

  /// >>> Text Editing Controller for start transaction
  final amountController = TextEditingController();
  final rateController = TextEditingController();

  /// >>> Send offer process
  get onSendOffer =>
      marketplaceBuyProcessApi().then((value) => _onSendSuccessOffer());

  /// >> set loading process & Make An Offer Model
  final _isLoading = false.obs;
  late CommonSuccessModel _makeAnOfferModel;

  /// >> get loading process & Make An Offer Model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get makeAnOfferModel => _makeAnOfferModel;

  ///* Make an offer api process
  Future<CommonSuccessModel> marketplaceBuyProcessApi() async {
    _isLoading.value = true;
    update();
    Map<String, String> inputBody = {
      'trade_id': tradeId.value,
      'rate': rateController.text,
      'type': 'OFFER',
    };
    await OfferApiServices.makeAnOfferProcessApi(body: inputBody).then((value) {
      _makeAnOfferModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _makeAnOfferModel;
  }

  _onSendSuccessOffer() {
    Get.to(
      () => CongratulationScreen(
        route: Routes.navigationScreen,
        subTitle: _makeAnOfferModel.message.success.first,
        title: Strings.congratulations,
      ),
    );
  }
}
