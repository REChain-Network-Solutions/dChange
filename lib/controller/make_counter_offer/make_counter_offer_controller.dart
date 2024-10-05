import '../../backend/model/common/common_success_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/offer/offer_api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../views/congratulation/congratulation_screen.dart';
import '../get_offer/get_offer_controller.dart';

class MakeCounterOfferController extends GetxController {
  final controller = Get.put(GetOfferController());

  /// >>> Exchange Rate
  RxDouble sellAmount = 0.0.obs;
  RxDouble counterSellAmount = 0.0.obs;
  RxString sellCurrency = ''.obs;
  RxDouble rateAmount = 0.0.obs;
  RxDouble counterRateAmount = 0.0.obs;
  RxString rateCurrency = ''.obs;

  /// >>> get seller information
  RxString sellerName = ''.obs;
  RxBool isVerified = false.obs;

  /// >>> Text Editing Controller for start transaction
  final amountController = TextEditingController();
  final rateController = TextEditingController();

  /// >>>  set variable for counter offer & offer accept/reject
  RxString tradeId = ''.obs;
  RxString receiverId = ''.obs;
  RxString creatorId = ''.obs;
  RxString targetId = ''.obs;
  RxBool isCounterOffer = false.obs;

  /// >>> set int value for loading accept process
  RxInt loadingIndex = (-1).obs;

  /// >>> Counter offer process
  get onCounterOffer =>
      counterOfferProcessApi().then((value) => _onCounterOfferSuccess());

  /// >>> offer reject process
  get onOfferReject => _onCounterOffer();

  _onCounterOffer() {}

  /// >> set loading process & Model
  final _isLoading = false.obs;
  final _isStatusLoading = false.obs;
  late CommonSuccessModel _counterOfferModel;
  late CommonSuccessModel _offerStatusModel;

  /// >> get loading process & Model
  bool get isLoading => _isLoading.value;
  bool get isStatusLoading => _isStatusLoading.value;
  CommonSuccessModel get offerStatusModel => _offerStatusModel;
  CommonSuccessModel get counterOfferModel => _counterOfferModel;

  ///* Make an offer api process
  Future<CommonSuccessModel> counterOfferProcessApi() async {
    _isLoading.value = true;
    update();
    Map<String, String> inputBody = {
      'rate': rateController.text,
      'trade_id': tradeId.value,
      'type': 'COUNTER_OFFER',
      'receiver_id': receiverId.value,
      'creator_id': creatorId.value,
    };
    await OfferApiServices.counterOfferProcessApi(body: inputBody)
        .then((value) {
      _counterOfferModel = value!;

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _counterOfferModel;
  }

  _onCounterOfferSuccess() {
    Get.to(
      () => CongratulationScreen(
        route: Routes.navigationScreen,
        subTitle: _counterOfferModel.message.success.first,
        title: Strings.congratulations,
      ),
    );
  }

  ///* offer status api process
  Future<CommonSuccessModel> offerStatusProcessApi(String type) async {
    _isStatusLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'target': targetId.value,
      'type': type,
    };
    await OfferApiServices.offerStatusProcessApi(body: inputBody).then((value) {
      _offerStatusModel = value!;
      controller.getOffersProcessApi();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isStatusLoading.value = false;
    update();
    return _offerStatusModel;
  }
}
