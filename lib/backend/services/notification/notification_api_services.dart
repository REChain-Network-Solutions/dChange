import '../../model/notification/notification_info_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class NotificationApiServices {
  ///* Notification get process api
  static Future<NotificationInfoModel?> notificationGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.notificationURL,
        code: 200,
      );
      if (mapResponse != null) {
        NotificationInfoModel result =
            NotificationInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Notification get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in NotificationInfoModel');
      return null;
    }
    return null;
  }
}
