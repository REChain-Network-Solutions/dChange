import 'package:dchange/backend/model/common/common_success_model.dart';

import '../../model/offer/get_offer_model.dart';
import '../../model/offer/offer_buy_confirm_model.dart';
import '../../model/offer/offer_buy_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class OfferApiServices {
  ///*  Get offer process api
  static Future<GetOfferModel?> getOfferApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.getOfferListURL,
        code: 200,
      );
      if (mapResponse != null) {
        GetOfferModel result = GetOfferModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Make an offer process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*  Make an offer process api
  static Future<CommonSuccessModel?> makeAnOfferProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.makeAnOfferURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Make an offer process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*  Counter offer process api
  static Future<CommonSuccessModel?> counterOfferProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.counterOfferURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from counter offer process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Offer status process api
  static Future<CommonSuccessModel?> offerStatusProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.offerStatusURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Offer status process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Offer buy process api
  static Future<OfferBuyModel?> offerBuyProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.buyOfferURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        OfferBuyModel result = OfferBuyModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Offer buy process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Offer buy confirm process api
  static Future<OfferBuyConfirmModel?> offerConfirmProcessApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.offerConfirmURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        OfferBuyConfirmModel result =
            OfferBuyConfirmModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Offer buy confirm process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Offer evidence submit process api
  static Future<CommonSuccessModel?> offerEvidenceSubmitProcessApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
        ApiEndpoint.offerSubmitURL,
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
          '🐞🐞🐞 err from offer evidence submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
