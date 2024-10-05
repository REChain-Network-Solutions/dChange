import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/backend/model/marketplace/marketplace_info_model.dart';
import 'package:dchange/backend/services/marketplace/marketplace_api_services.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_screen_imports.dart';

import '../../backend/utils/api_method.dart';
import '../../routes/routes.dart';
import '../currency/currency_controller.dart';

class MarketplaceController extends GetxController {
  final currency = Get.put(CurrencyController());
  RxDouble amount = 0.0.obs;
  RxDouble rate = 0.0.obs;
  RxBool isFilter = false.obs;
  @override
  void onInit() {
    marketplaceInfoGetProcessApi();
    super.onInit();
  }

  /// >> set loading process & Marketplace Info Model
  final _isLoading = false.obs;
  late MarketplaceInfoModel _marketplaceInfoModel;

  /// >> get loading process & Marketplace Info Model
  bool get isLoading => _isLoading.value;
  MarketplaceInfoModel get marketplaceInfoModel => _marketplaceInfoModel;

  ///* Marketplace info get api process
  Future<MarketplaceInfoModel> marketplaceInfoGetProcessApi() async {
    _isLoading.value = true;
    update();
    await MarketplaceApiServices.getMarketplaceProcessApi(
      amount,
      rate,
      currency.sellCurrencyId.value,
      LocalStorage.getQrCodeId(),
      isFilter: isFilter.value,
      isDeepLink: LocalStorage.getDeepLink(),
    ).then((value) {
      _marketplaceInfoModel = value!;
      if (LocalStorage.getDeepLink()) {
        onResetFilterValue();
        Routes.filterItemsScreen.offAllNamed;
      }
      onResetFilterValue();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _marketplaceInfoModel;
  }

  onResetFilterValue() {
    rate.value = 0.0;
    amount.value = 0.0;
    isFilter.value = false;
    LocalStorage.removeDeepLinkValue();
    debugPrint(
        '<<<<<<<<<<<<<< clear rate amount or deep link value >>>>>>>>>>>>>');
    update();
  }
}
