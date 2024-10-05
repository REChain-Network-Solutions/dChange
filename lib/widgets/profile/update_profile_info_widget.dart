part of '../../views/profile/update_profile_screen.dart';

class UpdateProfileInfoWidget extends StatelessWidget {
  const UpdateProfileInfoWidget({super.key, required this.controller});
  final UpdateProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ImagePickerWidget(
            isImagePathSet: controller.isImagePathSet.value,
            imagePath: controller.userImagePath.value,
            imageUrl: controller.userImage.value,
            onImagePick: () {
              _showImagePickerBottomSheet(context);
            },
          ),
        ),
        _nameAndEmailWidget()
      ],
    ).paddingOnly(top: Dimensions.paddingSize * 0.4);
  }

  _nameAndEmailWidget() {
    return Column(
      children: [
        TitleHeading3Widget(
          text: controller.userFullName.value,
        ).paddingOnly(
          top: Dimensions.paddingSize * 0.5,
          bottom: Dimensions.paddingSize * 0.1,
        ),
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TitleHeading4Widget(
              text: controller.userEmailAddress.value,
              opacity: 0.60,
            ),
            horizontalSpace(Dimensions.widthSize),
            Visibility(
              visible: LocalStorage.isUserVerified() &&
                  controller.userEmailAddress.value != '',
              child: CustomImageWidget(
                path: Assets.icon.checkmarkGreen,
                height: Dimensions.heightSize,
              ),
            )
          ],
        ).paddingOnly(bottom: Dimensions.paddingSize * 1.6),
      ],
    );
  }

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: ImagePickerSheet(
            fromCamera: () {
              Get.back();
              controller.chooseImageFromCamera();
            },
            fromGallery: () {
              Get.back();
              controller.chooseImageFromGallery();
            },
          ),
        );
      },
    );
  }
}
