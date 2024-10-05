import '../../backend/model/marketplace/marketplace_transaction_model.dart';
import '../../backend/services/marketplace/marketplace_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class TransactionController extends GetxController {
  List<LatestTransaction> latestTransactions = [];
  @override
  void onInit() {
    getMarketplaceTransactionApiProcess();
    super.onInit();
  }

  /// >> set loading process & Marketplace Latest Transaction Model
  final _isLoading = false.obs;
  late MarketplaceLatestTransactionModel _marketplaceTrxModel;

  /// >> get loading process & Marketplace Latest Transaction Model
  bool get isLoading => _isLoading.value;
  MarketplaceLatestTransactionModel get marketplaceTrxModel =>
      _marketplaceTrxModel;

  ///* Marketplace transaction api process
  Future<MarketplaceLatestTransactionModel>
      getMarketplaceTransactionApiProcess() async {
    _isLoading.value = true;

    update();

    await MarketplaceApiServices.getLatestTransactionProcessApi().then((value) {
      _marketplaceTrxModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _marketplaceTrxModel;
  }
}
