import 'package:dchange/backend/model/add_money/add_money_info_model.dart';

import '../../model/add_money/tatum_gateway_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';
import 'package:dchange/backend/model/common/common_success_model.dart';
import '../../model/add_money/add_money_flutter_wave_model.dart';
import '../../model/add_money/add_money_paypal_insert_model.dart';
import '../../model/add_money/add_money_stripe_insert_model.dart';
import '../../model/add_money/add_money_manual_insert_model.dart';
import '../../utils/logger.dart';

final log = logger(AddMoneyApiServices);

class AddMoneyApiServices {
  ///* Add money get process api
  static Future<AddMoneyInfoModel?> getAddMoneyInfoApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.addMoneyInfoURL,
        code: 200,
      );
      if (mapResponse != null) {
        AddMoneyInfoModel result = AddMoneyInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Add money get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in AddMoneyInfoModel');
      return null;
    }
    return null;
  }

  ///* Add money insert paypal process api
  static Future<AddMoneyPaypalInsertModel?> addMoneyInsertPaypalApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.addMoneyInsertURL, body, code: 200);
      if (mapResponse != null) {
        AddMoneyPaypalInsertModel result =
            AddMoneyPaypalInsertModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('err from Add money insert paypal process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Add money flutter wave process api
  static Future<AddMoneyFlutterWavePaymentModel?> addMoneyInsertFlutterWaveApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.addMoneyInsertURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        AddMoneyFlutterWavePaymentModel result =
            AddMoneyFlutterWavePaymentModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from Add money flutter wave process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Add money insert stripe process api
  static Future<AddMoneyStripeInsertModel?> addMoneyInsertStripeApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.addMoneyInsertURL, body, code: 200);
      if (mapResponse != null) {
        AddMoneyStripeInsertModel result =
            AddMoneyStripeInsertModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from Add money insert stripe process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Add money stripe confirm process api
  static Future<CommonSuccessModel?> addMoneyStripeConfirmApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.stripePayConfirm, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from  Add money stripe confirm process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Add money manual insert process api
  static Future<AddMoneyManualInsertModel?> addMoneyManualInsertApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.addMoneyInsertURL, body, code: 200);
      if (mapResponse != null) {
        AddMoneyManualInsertModel result =
            AddMoneyManualInsertModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from Add money manual insert process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Add money manual payment confirm process api
  static Future<CommonSuccessModel?> manualPaymentConfirmApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
          ApiEndpoint.addMoneyManualPaymentConfirm, body,
          fieldList: fieldList, pathList: pathList, code: 200);

      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          'err from Add money manual payment confirm process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // add money tatum gateway
  static Future<TatumGatewayModel?> tatumInsertApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.addMoneyInsertURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        TatumGatewayModel result = TatumGatewayModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from tatum api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  /// Tatum confirm process
  static Future<CommonSuccessModel?> tatumConfirmApiProcess(
      {required Map<String, dynamic> body, required String url}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(url, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('err from Tatum confirm  api service ==> $e');
      // CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
