// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:dchange/backend/model/profile/profile_info_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../backend/services/profile/profile_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class UpdateProfileController extends GetxController {
  /// >>> Text Editing Controller for update profile
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final sateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final countryController = TextEditingController();

  /// >>> set value for country
  RxString selectCountry = ''.obs;
  RxString selectCountryCode = ''.obs;

  RxString userImagePath = ''.obs;
  RxString userEmailAddress = ''.obs;
  RxString userFullName = ''.obs;
  RxString userImage = ''.obs;
  RxString defaultImage = ''.obs;

  //-> Image Picker
  RxBool isImagePathSet = false.obs;
  File? image;
  ImagePicker picker = ImagePicker();
  chooseImageFromGallery() async {
    var pickImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }

  chooseImageFromCamera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }

  get onUpdateProfile => isImagePathSet.value
      ? profileUpdateWithImageProcess()
      : profileUpdateWithOutImageProcess();
  @override
  void onInit() {
    getProfileInfoProcess();
    super.onInit();
  }

  /// >> set loading process & Profile Info Model
  final _isLoading = false.obs;
  late ProfileInfoModel _profileInfoModel;

  /// >> get loading process & Profile Info Model
  bool get isLoading => _isLoading.value;
  ProfileInfoModel get profileInfoModel => _profileInfoModel;

  ///* Get profile info api process
  Future<ProfileInfoModel> getProfileInfoProcess() async {
    _isLoading.value = true;
    update();

    await ProfileApiServices.getProfileInfoProcessApi().then((value) {
      _profileInfoModel = value!;
      _setData(_profileInfoModel);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _profileInfoModel;
  }

  void _setData(ProfileInfoModel profileModel) {
    var data = profileModel.data;
    userFullName.value = '${data.user.firstName} ${data.user.lastName}';
    firstNameController.text = data.user.firstName;
    lastNameController.text = data.user.lastName;
    phoneNumberController.text = data.user.mobile;
    addressController.text = data.user.address.address;
    cityController.text = data.user.address.city;
    sateController.text = data.user.address.state;
    zipCodeController.text = data.user.address.zipCode;
    userEmailAddress.value = data.user.email;
    countryController.text = data.user.address.country;
    selectCountry.value = data.user.address.country;

    debugPrint(data.user.address.country);
    LocalStorage.saveEmail(email: data.user.email);
    LocalStorage.saveName(name: userFullName.value);
    LocalStorage.saveNumber(num: data.user.fullMobile);
    if (data.user.image != '') {
      userImage.value =
          '${ApiEndpoint.mainDomain}/${data.imagePath}/' + data.user.image;
    } else {
      userImage.value = '${ApiEndpoint.mainDomain}/${data.defaultImage}';
    }

    debugPrint(data.user.emailVerified.toString());
    if (data.user.emailVerified == 1 && data.user.kycVerified == 1) {
      LocalStorage.saveUserVerified(value: true);
    } else {
      LocalStorage.saveUserVerified(value: false);
    }

    update();
  }

  /// >> set loading process & profile update model
  final _isUpdateLoading = false.obs;
  late CommonSuccessModel _profileUpdateModel;

  /// >> get loading process & profile update model
  bool get isUpdateLoading => _isUpdateLoading.value;
  CommonSuccessModel get profileUpdateModel => _profileUpdateModel;

  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'phone': phoneNumberController.text,
      'country': selectCountry.value,
      'city': cityController.text,
      'state': sateController.text,
      'address': addressController.text,
      'phone_code': selectCountryCode.value,
      'zip_code': zipCodeController.text,
    };

    await ProfileApiServices.updateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;
      getProfileInfoProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }

  // Profile update process with image
  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'country': selectCountry.value,
      'state': sateController.text,
      'address': addressController.text,
      'city': cityController.text,
      'zip_code': zipCodeController.text,
      'phone_code': selectCountryCode.value,
      'phone': phoneNumberController.text,
    };

    await ProfileApiServices.updateProfileWithImageApi(
      body: inputBody,
      filepath: userImagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;
      getProfileInfoProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }
}
