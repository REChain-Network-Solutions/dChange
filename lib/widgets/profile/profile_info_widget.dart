part of '../../views/profile/profile_screen.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key, required this.controller});
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: ImagePickerWidget(
              isPicker: false,
              imageUrl: controller.controller.userImage.value,
            ),
          ),
        ),
        _nameAndEmailWidget()
      ],
    ).paddingOnly(top: Dimensions.paddingSize * 2);
  }

  _nameAndEmailWidget() {
    return Obx(
      () => Column(
        children: [
          TitleHeading3Widget(
            text: controller.controller.userFullName.value,
          ).paddingOnly(
            top: Dimensions.paddingSize * 0.5,
            bottom: Dimensions.paddingSize * 0.1,
          ),
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              TitleHeading4Widget(
                text: controller.controller.userEmailAddress.value,
                opacity: 0.60,
                textAlign: TextAlign.center,
              ),
              horizontalSpace(Dimensions.widthSize),
              Visibility(
                visible: LocalStorage.isUserVerified() &&
                    controller.controller.userEmailAddress.value != '',
                child: CustomImageWidget(
                  path: Assets.icon.checkmarkGreen,
                  height: Dimensions.heightSize,
                ),
              )
            ],
          ).paddingOnly(bottom: Dimensions.paddingSize * 1.6),
        ],
      ),
    );
  }
}
