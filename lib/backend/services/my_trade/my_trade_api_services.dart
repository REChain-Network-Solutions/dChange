import 'package:dchange/backend/model/common/common_success_model.dart';

import '../../model/my_trade/trade_confirm_model.dart';
import '../../model/my_trade/trade_edit_info_model.dart';
import '../../model/my_trade/trade_info_model.dart';
import '../../model/my_trade/trade_submit_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class MyTradeApiServices {
  ///* My Trade get process api
  static Future<MyTradeInfoModel?> myTradeGetApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.myTradeInfoURL,
        code: 200,
      );
      if (mapResponse != null) {
        MyTradeInfoModel result = MyTradeInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from My Trade get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in MyTradeInfoModel');
      return null;
    }
    return null;
  }

  ///* My Trade Edit get info process api
  static Future<TradeEditInfoModel?> tradeEditInfoGetApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myTradeEditURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        TradeEditInfoModel result = TradeEditInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from My My Trade Edit get info process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in TradeEditInfoModel');
      return null;
    }
    return null;
  }

  ///*  My Trade submit process api
  static Future<TradeSubmitModel?> myTradeSubmitApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myTradeSubmitURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        TradeSubmitModel result = TradeSubmitModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from My Trade submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in My Trade submit process api');
      return null;
    }
    return null;
  }

  ///*  My Trade confirm process api
  static Future<TradeConfirmModel?> myTradeConfirmApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myTradeConfirmURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        TradeConfirmModel result = TradeConfirmModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from My Trade confirm process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in My Trade confirm process api');
      return null;
    }
    return null;
  }

  ///*  My Trade Close process api
  static Future<CommonSuccessModel?> myTradeCloseApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myTradeCloseURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from My Trade Close process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in My Trade Close process api');
      return null;
    }
    return null;
  }

  ///*  My Trade Update process api
  static Future<CommonSuccessModel?> myTradeUpdateApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.myTradeUpdateURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from My Trade Update process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
        'Something went Wrong! in My Trade Update process api',
      );
      return null;
    }
    return null;
  }
}
