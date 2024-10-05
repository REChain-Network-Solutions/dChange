part of '../../views/profile/update_profile_screen.dart';

class UpdateProfileFieldsWidget extends StatelessWidget {
  UpdateProfileFieldsWidget({super.key, required this.controller});
  final formKey = GlobalKey<FormState>();
  final UpdateProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.70,
        padding: EdgeInsets.all(Dimensions.paddingSize),
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? CustomColor.primaryBGDarkColor
              : CustomColor.primaryBGLightColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius * 3),
            topLeft: Radius.circular(Dimensions.radius * 3),
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: mainMin,
            children: [
              _firstNameAndLastNameWidget(context),
              _countryWidget(context),
              _phoneNumberWidget(context),
              _addressAndCityWidget(context),
              _stateAndZipCodeWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _firstNameAndLastNameWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.firstNameController,
            hintText: Strings.firstName,
            label: Strings.firstName,
            prefixIconPath: Assets.icon.clock,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.lastNameController,
            hintText: Strings.lastName,
            label: Strings.lastName,
            prefixIconPath: Assets.icon.lock,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _countryWidget(BuildContext context) {
    return ProfileCountryCodePickerWidget(
      controller: controller.countryController,
      hintText: '',
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _phoneNumberWidget(BuildContext context) {
    return Obx(
      () => PrimaryInputWidget(
        controller: controller.phoneNumberController,
        hintText: Strings.phoneNumber,
        label: Strings.phoneNumber,
        prefixIconPath: Assets.icon.callGray,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        textInputType: TextInputType.number,
        phoneCode: controller.selectCountryCode.value,
      ),
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _addressAndCityWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.addressController,
            hintText: Strings.address,
            label: Strings.address,
            prefixIconPath: Assets.icon.locationGray,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.cityController,
            hintText: Strings.city,
            label: Strings.city,
            prefixIconPath: Assets.icon.buildings,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _stateAndZipCodeWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.sateController,
            hintText: Strings.state,
            label: Strings.state,
            prefixIconPath: Assets.icon.imgMusic,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.zipCodeController,
            hintText: Strings.zipCode,
            label: Strings.zipCode,
            prefixIconPath: Assets.icon.map,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 2);
  }
}
