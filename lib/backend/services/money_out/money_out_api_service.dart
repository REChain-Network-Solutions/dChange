import '../../model/money_out/money_out_info_model.dart';
import '../../model/money_out/money_out_insert_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';
import 'package:dchange/backend/model/common/common_success_model.dart';
import '../../utils/logger.dart';

final log = logger(MoneyOutApiServices);

class MoneyOutApiServices {

//withdraw info
  static Future<WithdrawInfoModel?> withdrawInfoApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.withdrawInfoURL,
        code: 200,
        showResult: false,
      );
      if (mapResponse != null) {
        WithdrawInfoModel withdrawInfoModel =
            WithdrawInfoModel.fromJson(mapResponse);

        return withdrawInfoModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from withdraw info api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in withdraw info api');
      return null;
    }
    return null;
  }

//withdraw dynamic
 static Future<DynamicInputWithdrawModel?> withdrawInsertApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.withdrawInsertURL, body, code: 200);
      if (mapResponse != null) {
        DynamicInputWithdrawModel result =
            DynamicInputWithdrawModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from money out insert process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  // withdraw submit
  static Future<CommonSuccessModel?> withdrawSubmitApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).multipartMultiFile(
        ApiEndpoint.withdrawConfirmURL,
        body,
        showResult: true,
        fieldList: fieldList,
        pathList: pathList,
      );
      if (mapResponse != null) {
        CommonSuccessModel registrationModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     registrationModel.message.success.first.toString());

        return registrationModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from withdraw submit api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
