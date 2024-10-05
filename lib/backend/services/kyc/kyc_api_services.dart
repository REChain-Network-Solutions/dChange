
import '../../model/common/common_success_model.dart';
import '../../model/kyc/kyc_info_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class KycApiServices {
  ///* Kyc info get process api
  static Future<KycInfoModel?> getKycInfoApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.kycInfoURL,
        code: 200,
      );
      if (mapResponse != null) {
        KycInfoModel result = KycInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Kyc info get process api  service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in KycInfoModel');
      return null;
    }
    return null;
  }

  ///* Kyc submit process api
  static Future<CommonSuccessModel?> kycSubmitProcessApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    // print(pathList);
    // print(fieldList);
    // print(body);
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
        ApiEndpoint.kycSubmitURL,
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
      log.e('🐞🐞🐞 err from Kyc submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in _kycSubmitApiProcess');
      return null;
    }
    return null;
  }
}
