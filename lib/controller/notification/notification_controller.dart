import 'package:get/get.dart';

import '../../backend/model/notification/notification_info_model.dart';
import '../../backend/services/notification/notification_api_services.dart';
import '../../backend/utils/api_method.dart';

class NotificationController extends GetxController {
  @override
  void onInit() {
    getNotificationApiProcess();
    super.onInit();
  }

  /// >> set loading process & Notification Info Model
  final _isLoading = false.obs;
  late NotificationInfoModel _notificationInfoModel;

  /// >> get loading process & Notification Info Model
  bool get isLoading => _isLoading.value;
  NotificationInfoModel get notificationInfoModel => _notificationInfoModel;

  ///* Get trade info api process
  Future<NotificationInfoModel> getNotificationApiProcess() async {
    _isLoading.value = true;
    update();
    await NotificationApiServices.notificationGetApiProcess().then((value) {
      _notificationInfoModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _notificationInfoModel;
  }
}
