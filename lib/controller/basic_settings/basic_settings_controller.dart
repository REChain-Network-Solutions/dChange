import 'dart:async';

import 'package:dchange/utils/basic_screen_imports.dart';

import '../../backend/model/basic_settings/basic_settings_info_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/basic_settings/basic_settings_api_services.dart';

class BasicSettingsController extends GetxController {
  RxString splashImage = ''.obs;
  RxString onboardImage = ''.obs;
  RxString onBoardTitle = ''.obs;
  RxString onBoardSubTitle = ''.obs;
  RxString appBasicLogo = ''.obs;
  RxString privacyPolicy = ''.obs;
  RxString contactUs = ''.obs;
  RxString aboutUs = ''.obs;

  RxBool isVisible = false.obs;
  @override
  void onInit() {
    getBasicSettingsApiProcess().then(
      (value) => Timer(const Duration(seconds: 4), () {
        isVisible.value = true;
      }),
    );
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late BasicSettingsInfoModel _appSettingsModel;
  BasicSettingsInfoModel get appSettingsModel => _appSettingsModel;

  Future<BasicSettingsInfoModel> getBasicSettingsApiProcess() async {
    _isLoading.value = true;
    update();
    await BasicSettingsApiServices.getBasicSettingProcessApi().then((value) {
      _appSettingsModel = value!;
      saveInfo();
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _appSettingsModel;
  }

  void saveInfo() {
    /// >>> get splash & onboard data
    var onBoardData = _appSettingsModel.data.onboardScreen.first;
    var imageSplash = _appSettingsModel.data.splashScreen.splashScreenImage;
    var imageOnboard = onBoardData.image;
    var imagePath = _appSettingsModel.data.imagePath;
    splashImage.value = "${ApiEndpoint.mainDomain}/$imagePath/$imageSplash";
    onboardImage.value = "${ApiEndpoint.mainDomain}/$imagePath/$imageOnboard";
    onBoardTitle.value = onBoardData.title;
    onBoardSubTitle.value = onBoardData.subTitle;
    appBasicLogo.value =
        "${ApiEndpoint.mainDomain}/${_appSettingsModel.data.logoImagePath}/${_appSettingsModel.data.allLogo.siteLogo}";
    privacyPolicy.value = _appSettingsModel.data.webLinks.privacyPolicy;
    contactUs.value = _appSettingsModel.data.webLinks.contactUs;
    aboutUs.value = _appSettingsModel.data.webLinks.aboutUs;
  }
}
