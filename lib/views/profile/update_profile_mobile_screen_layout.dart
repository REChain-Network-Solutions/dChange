part of '../profile/update_profile_screen.dart';

class UpdateProfileMobileScreenLayout
    extends GetWidget<UpdateProfileController> {
  const UpdateProfileMobileScreenLayout({
    super.key,
    required this.controller,
  });

  @override
  final UpdateProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: Obx(
        () => controller.isUpdateLoading || controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        UpdateProfileInfoWidget(controller: controller),
        UpdateProfileFieldsWidget(controller: controller),
      ],
    );
  }

  _appBarWidget(BuildContext context) {
    return PrimaryAppBar(
      Strings.updateProfile,
      action: [
        Obx(
          () => Visibility(
            visible: !controller.isUpdateLoading,
            child: InkWell(
              onTap: () {
                controller.onUpdateProfile;
              },
              child: Container(
                height: Dimensions.heightSize * 2.3,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.marginSizeHorizontal * 0.375,
                ),
                margin: EdgeInsets.only(right: Dimensions.marginSizeHorizontal),
                decoration: ShapeDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.5),
                  ),
                ),
                child: const TitleHeading5Widget(
                  text: Strings.update,
                  color: CustomColor.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
