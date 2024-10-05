import 'dart:ui';

import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../controller/navigation/navigation_controller.dart';
import '../../controller/profile/update_profile_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/common/app_basic_logo.dart';
import '../../widgets/common/custom_container.dart';
import '../../widgets/common/image_picker_widget.dart';
import '../../widgets/common/others/custom_image_widget.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final controller = Get.put(NavigationController());
  final profileController = Get.put(UpdateProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      backgroundColor: CustomColor.primaryBGLightColor,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.background.drawerBg.path,
            ),
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: ListView(
          children: [
            _appLogoWidget(context),
            _userInfoWidget(context),
            _drawerTitle(context),
          ],
        ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.5),
      ),
    );
  }

  _userInfoWidget(BuildContext context) {
    return Column(
      children: [
        Animate(
            effects: const [
              FadeEffect(),
              ScaleEffect(),
            ],
            child: ImagePickerWidget(
              isPicker: false,
              imageUrl: profileController.userImage.value,
            )),
        TitleHeading3Widget(
          text: profileController.userFullName.value,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        )
            .paddingOnly(
              top: Dimensions.paddingSize * 0.5,
              bottom: Dimensions.paddingSize * 0.1,
            )
            .animate()
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
        TitleHeading4Widget(
          text: profileController.userEmailAddress.value,
          opacity: 0.60,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        )
            .paddingOnly(bottom: Dimensions.paddingSize * 0.8)
            .animate()
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
      ],
    );
  }

  _appLogoWidget(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // Get.back();
            Get.close(1);
          },
          child: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode
                ? CustomColor.whiteColor
                : CustomColor.blackColor,
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 3),
        const AppBasicLogo(scale: 22),
      ],
    ).paddingOnly(
      bottom: Dimensions.paddingSize * 2.3,
      top: Dimensions.heightSize * 0.5,
    );
  }

  _drawerTitle(BuildContext context) {
    return Column(
        children: AnimateList(
      children: [
        buildMenuItem(
          context,
          title: Strings.transactions,
          imagePath: Assets.icon.history,
          onTap: () {
            controller.onTransaction;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.identityVerification,
          imagePath: Assets.icon.locationWhite,
          onTap: () {
            controller.onIdentityVerification;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.changePassword,
          imagePath: Assets.icon.keyBold,
          onTap: () {
            controller.onChangePassword;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.helpCenter,
          imagePath: Assets.icon.helpCircle,
          onTap: () {
            controller.onHelpCenter;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.privacyAndPolicy,
          imagePath: Assets.icon.privacy,
          onTap: () {
            controller.onPrivacyAndPolicy;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.aboutUs,
          imagePath: Assets.icon.biinfocircle,
          onTap: () {
            controller.onAboutUs;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.settings,
          imagePath: Assets.icon.setting,
          onTap: () {
            controller.onSettings;
          },
        ),
        ////
        buildMenuItem(
          context,
          title: Strings.signOut,
          imagePath: Assets.icon.powerOff,
          onTap: () {
            signOutDialog(context, controller);
          },
        ),
      ],
    ));
  }

  buildMenuItem(
    context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
    double scaleImage = 1,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize,
            vertical: Dimensions.paddingSize * 0.1,
          ),
          child: ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              ),
              child: CustomImageWidget(
                path: imagePath,
                height: Dimensions.heightSize * 1.8,
                width: Dimensions.widthSize * 2,
                color: CustomColor.whiteColor,
              ),
            ),
            title: TitleHeading3Widget(
              text: title,
            ),
            onTap: onTap,
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }
}

signOutDialog(BuildContext context, NavigationController controller) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Dialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisSize: mainMin,
              children: [
                const TitleHeading2Widget(
                  text: Strings.signOutAlert,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(Dimensions.heightSize),
                const TitleHeading4Widget(
                  text: Strings.areYouSure,
                  textAlign: TextAlign.start,
                  opacity: 0.80,
                ),
                verticalSpace(Dimensions.heightSize),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomContainer(
                          height: Dimensions.buttonHeight * 0.7,
                          borderRadius: Dimensions.radius * 0.8,
                          color: Get.isDarkMode
                              ? CustomColor.primaryBGLightColor
                                  .withOpacity(0.15)
                              : CustomColor.primaryBGDarkColor
                                  .withOpacity(0.15),
                          child: const TitleHeading4Widget(
                            text: Strings.cancel,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(Dimensions.widthSize),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.signOutProcess();
                        },
                        child: Obx(
                          () => controller.isLoading
                              ? const CustomLoadingAPI()
                              : CustomContainer(
                                  height: Dimensions.buttonHeight * 0.7,
                                  borderRadius: Dimensions.radius * 0.8,
                                  color: Theme.of(context).primaryColor,
                                  child: const TitleHeading4Widget(
                                    text: Strings.okay,
                                    color: CustomColor.whiteColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ).paddingAll(Dimensions.paddingSize * 0.5),
              ],
            ),
          ),
        ),
      );
    },
  );
}
