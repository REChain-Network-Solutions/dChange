import 'package:dchange/backend/model/profile/profile_info_model.dart';

import '../../model/common/common_success_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class ProfileApiServices {
  ///* Get profile info process api
  static Future<ProfileInfoModel?> getProfileInfoProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.profileInfoGetURL,
        code: 200,
      );
      if (mapResponse != null) {
        ProfileInfoModel result = ProfileInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from  Get profile info process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in Profile Info Model');
      return null;
    }
    return null;
  }

  ///* update profile process api
  static Future<CommonSuccessModel?> updateProfileWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.profileUpdateURL, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(result.message.success.first.toString());
        return result;
      }
    } catch (e) {
      log.e('err from update profile process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* update profile with img process api
  static Future<CommonSuccessModel?> updateProfileWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
          ApiEndpoint.profileUpdateURL, body, filepath, 'image',
          code: 200);

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            profileUpdateModel.message.success.first.toString());
        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from update profile with img process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
