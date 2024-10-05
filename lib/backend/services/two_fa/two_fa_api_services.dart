import 'package:dchange/backend/model/common/common_success_model.dart';
import 'package:dchange/backend/model/two_fa/two_fa_info_model.dart';

import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class TwoFaApiServices {
  ///* Two fa get process api
  static Future<TwoFaInfoModel?> twoFaGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.twoFaGetURL,
        code: 200,
      );
      if (mapResponse != null) {
        TwoFaInfoModel result = TwoFaInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in TwoFaInfoModel');
      return null;
    }
    return null;
  }

  ///* Two fa submit process api
  static Future<CommonSuccessModel?> twoFaSubmitApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.twoFaSubmitURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Two fa submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(
          'Something went Wrong! in Two fa submit process api services');
      return null;
    }
    return null;
  }
}
