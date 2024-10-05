import 'package:dchange/backend/model/common/common_success_model.dart';
import 'package:dchange/backend/model/marketplace/marketplace_info_model.dart';

import '../../model/marketplace/marketplace_buy_confirm.model.dart';
import '../../model/marketplace/marketplace_buy_model.dart';
import '../../model/marketplace/marketplace_transaction_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class MarketplaceApiServices {
  ///* Marketplace get info process api
  static Future<MarketplaceInfoModel?> getMarketplaceProcessApi(
    amount,
    rate,
    currencyId,
    id, {
    required bool isFilter,
    required bool isDeepLink,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        isDeepLink
            ? "${ApiEndpoint.marketplaceListURL}?id=$id"
            : isFilter
                ? amount == 0.0 || rate == 0.0
                    ? "${ApiEndpoint.marketplaceListURL}?currency=$currencyId"
                    : "${ApiEndpoint.marketplaceListURL}?max_amount=$amount&min_amount=1&max_rate=$rate&min_rate=1&currency=$currencyId"
                : ApiEndpoint.marketplaceListURL,
        code: 200,
      );
      if (mapResponse != null) {
        MarketplaceInfoModel result =
            MarketplaceInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Marketplace get info process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in MarketplaceInfoModel');
      return null;
    }
    return null;
  }

  ///* Latest transaction get info process api
  static Future<MarketplaceLatestTransactionModel?>
      getLatestTransactionProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.marketplaceTransactionsListURL,
        code: 200,
      );
      if (mapResponse != null) {
        MarketplaceLatestTransactionModel result =
            MarketplaceLatestTransactionModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Latest transaction get info process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in MarketplaceLatestTransactionModel');
      return null;
    }
    return null;
  }

  ///*  Marketplace buy process api
  static Future<MarketplaceBuyModel?> marketplaceBuyProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.marketplaceBuyURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        MarketplaceBuyModel result = MarketplaceBuyModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Marketplace buy process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*  Marketplace buy confirm process api
  static Future<MarketplaceBuyConfirmModel?> marketplaceBuyConfirmProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.marketplaceBuyConfirmURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        MarketplaceBuyConfirmModel result =
            MarketplaceBuyConfirmModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Marketplace confirm process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*  Marketplace evidence submit process api
  static Future<CommonSuccessModel?> marketplaceEvidenceSubmitProcessApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
        ApiEndpoint.marketplaceEvidenceSubmitURL,
        body,
        code: 200,
        fieldList: fieldList,
        pathList: pathList,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Marketplace evidence submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
