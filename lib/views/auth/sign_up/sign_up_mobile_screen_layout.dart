part of '../sign_up/sign_up_screen.dart';

class SignUpMobileScreenLayout extends StatelessWidget {
  SignUpMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final SignUpController controller;
  final basicSettingsController = Get.put(BasicSettingsController());

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        verticalSpace(Dimensions.marginSizeVertical * 4),
        const AppBasicLogo(),
        _welcomeTextWidget(context),
        _fieldsWidget(context),
      ],
    );
  }

  _welcomeTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      text: Strings.welcomeSignUp,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(.60)
          : CustomColor.primaryLightTextColor.withOpacity(.60),
      textAlign: TextAlign.center,
    ).paddingOnly(
      bottom: Dimensions.heightSize * 2,
      right: Dimensions.paddingSize * 0.5,
      left: Dimensions.paddingSize * 0.5,
    );
  }

  _buttonWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical,
      ),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.signUp,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.agreed.value) {
                      controller.onSignUp;
                    } else {
                      CustomSnackBar.error(Strings.pleaseAgree);
                    }
                  }
                },
              ),
      ),
    );
  }

  _fieldsWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.6,
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _inputFieldWidget(context),
            _agreedWidget(context),
            _buttonWidget(context),
            _alreadyHaveAccountWidget(context),
            verticalSpace(Dimensions.heightSize),
          ],
        ),
      ),
    );
  }

  _agreedWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.66),
      child: Row(
        children: [
          Obx(
            () => SizedBox(
              height: 24.0.h,
              width: 24.0.w,
              child: Checkbox(
                value: controller.agreed.value,
                onChanged: (value) {
                  controller.agreed.value = value!;
                },
                activeColor: Theme.of(context).primaryColor,
                checkColor: controller.agreed.value
                    ? Theme.of(context).colorScheme.background
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.2),
                ),
                side: BorderSide(
                  color: Get.isDarkMode
                      ? CustomColor.primaryDarkTextColor.withOpacity(0.50)
                      : CustomColor.primaryLightTextColor.withOpacity(0.50),
                ),
              ),
            ),
          ),
          horizontalSpace(Dimensions.widthSize * 0.4),
          RichText(
            text: TextSpan(
              text: Get.find<LanguageController>()
                  .getTranslation(Strings.iAgreedWith),
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle
                  : CustomStyle.lightHeading5TextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (controller.agreed.value) {
                    controller.agreed.value = false;
                  } else {
                    controller.agreed.value = true;
                  }
                },
              children: [
                TextSpan(
                  text: Get.find<LanguageController>()
                      .getTranslation(Strings.terms),
                  style: Get.isDarkMode
                      ? CustomStyle.darkHeading5TextStyle
                      : CustomStyle.lightHeading5TextStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (controller.agreed.value) {
                        controller.agreed.value = false;
                      } else {
                        controller.agreed.value = true;
                      }
                    },
                ),
                TextSpan(
                  text: Get.find<LanguageController>()
                      .getTranslation(Strings.and),
                  style: Get.isDarkMode
                      ? CustomStyle.darkHeading5TextStyle
                      : CustomStyle.lightHeading5TextStyle,
                ),
                TextSpan(
                  text: Get.find<LanguageController>()
                      .getTranslation(Strings.privacyPolicy),
                  style: Get.isDarkMode
                      ? CustomStyle.darkHeading5TextStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                        )
                      : CustomStyle.lightHeading5TextStyle.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(
                        () => WebViewScreen(
                          title: Strings.privacyPolicy,
                          url: basicSettingsController
                              .appSettingsModel.data.webLinks.privacyPolicy,
                        ),
                      );
                    },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _alreadyHaveAccountWidget(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: Get.find<LanguageController>()
              .getTranslation(Strings.alreadyHaveAn),
          style: Get.isDarkMode
              ? CustomStyle.darkHeading5TextStyle
              : CustomStyle.lightHeading5TextStyle,
          children: [
            TextSpan(
              text:
                  Get.find<LanguageController>().getTranslation(Strings.signIn),
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                    )
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.onSignIn;
                },
            )
          ],
        ),
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PrimaryInputWidget(
                controller: controller.firstNameController,
                hintText: Strings.enterName,
                label: Strings.firstName,
                prefixIconPath: Assets.icon.user,
                textInputType: TextInputType.text,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              child: PrimaryInputWidget(
                controller: controller.lastNameController,
                hintText: Strings.enterName,
                label: Strings.lastName,
                prefixIconPath: Assets.icon.user,
                textInputType: TextInputType.text,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 1.6),
        PrimaryInputWidget(
          controller: controller.emailAddressController,
          hintText: Strings.enterEmailAddress,
          label: Strings.emailAddress,
          prefixIconPath: Assets.icon.clock,
          textInputType: TextInputType.emailAddress,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        verticalSpace(Dimensions.heightSize * 1.6),
        PrimaryInputWidget(
          controller: controller.passwordController,
          hintText: Strings.enterYourPassword,
          label: Strings.password,
          prefixIconPath: Assets.icon.lock,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          isPasswordField: true,
          textInputType: TextInputType.text,
        ),
      ],
    );
  }
}
