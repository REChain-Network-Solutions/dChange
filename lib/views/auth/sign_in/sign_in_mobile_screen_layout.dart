part of '../sign_in/sign_in_screen.dart';

class SignIndMobileScreenLayout extends StatelessWidget {
  SignIndMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final SignInController controller;
  final formKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final biometric = Get.put(BiometricController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(context));
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        verticalSpace(Dimensions.marginSizeVertical * 4),
        const AppBasicLogo(),
        _welcomeTextWidget(context),
        _inputFieldWidget(context),
      ],
    );
  }

  _welcomeTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      text: Strings.welcomeToChange,
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
            : Column(
                children: [
                  PrimaryButton(
                    title: Strings.signIn,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.onSignIn;
                      }
                    },
                  ),
                  verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 2),
                  Visibility(
                    visible: biometric.supportState == SupportState.supported &&
                        LocalStorage.isLoggedIn(),
                    child: PrimaryButton(
                      title: Strings.signInWithTouchId,
                      onPressed: () async {
                        bool isAuthenticated =
                            await Authentication.authenticateWithBiometrics();

                        if (isAuthenticated) {
                          Get.offAndToNamed(Routes.navigationScreen);
                        } else {
                          debugPrint('isAuthenticated : false');
                        }
                      },
                      buttonTextColor: Theme.of(context).primaryColor,
                      buttonColor: Colors.transparent,
                      elevation: 0,
                      borderColor: Theme.of(context).primaryColor,
                      borderWidth: 1.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.sizeOf(context).height,
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
        child: Column(
          children: [
            PrimaryInputWidget(
              controller: controller.emailAddressController,
              hintText: Strings.enterEmailAddress,
              label: Strings.email,
              prefixIconPath: Assets.icon.clock,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              textInputType: TextInputType.emailAddress,
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
            _isRememberMeWidget(context),
            _buttonWidget(context),
            _doNotHaveAnAccount(context)
          ],
        ),
      ),
    );
  }

  _isRememberMeWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.66),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Row(
            children: [
              Obx(
                () => SizedBox(
                  height: 24.0.h,
                  width: 24.0.w,
                  child: Checkbox(
                    value: controller.isRemember.value,
                    onChanged: (value) {
                      controller.isRemember.value = value!;
                    },
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: controller.isRemember.value
                        ? Theme.of(context).colorScheme.background
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.2),
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
              InkWell(
                onTap: () {
                  if (controller.isRemember.value) {
                    controller.isRemember.value = false;
                  } else {
                    controller.isRemember.value = true;
                  }
                },
                child: const TitleHeading5Widget(
                  text: Strings.rememberMe,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              _showForgotPasswordDialog(context);
            },
            child: TitleHeading5Widget(
              text: Strings.forgotPassword,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  _doNotHaveAnAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: Get.find<LanguageController>()
            .getTranslation(Strings.doNotHaveAnAccount),
        style: Get.isDarkMode
            ? CustomStyle.darkHeading5TextStyle
            : CustomStyle.lightHeading5TextStyle,
        children: [
          TextSpan(
            text: Get.find<LanguageController>().getTranslation(Strings.signUp),
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                  )
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                controller.onSignUp;
              },
          )
        ],
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Dialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
            child: Form(
              key: forgotPasswordFormKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: mainMin,
                    children: [
                      const TitleSubTitleWidget(
                        title: Strings.forgotPassword,
                        subTitle: Strings.pleaseEnterYour,
                      ),
                      verticalSpace(Dimensions.marginSizeVertical),
                      PrimaryInputWidget(
                        controller:
                            controller.forgotPasswordEmailAddressController,
                        hintText: Strings.enterEmailAddress,
                        label: Strings.email,
                        prefixIconPath: Assets.icon.clock,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        textInputType: TextInputType.emailAddress,
                      ),
                      verticalSpace(Dimensions.marginBetweenInputBox),
                      Obx(
                        () => controller.isForgotPasswordLoading
                            ? const CustomLoadingAPI()
                            : PrimaryButton(
                                title:
                                    Strings.forgotPassword.replaceAll('?', ''),
                                onPressed: () {
                                  if (forgotPasswordFormKey.currentState!
                                      .validate()) {
                                    LocalStorage.saveEmail(
                                        email: controller
                                            .forgotPasswordEmailAddressController
                                            .text);
                                    controller.onForgotPassword;
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: -32,
                    top: -32,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: Dimensions.radius * 1.4,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.close_rounded,
                          color: CustomColor.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
