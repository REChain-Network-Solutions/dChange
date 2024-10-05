part of 'two_fa_verification_screen.dart';

class TwoFaVerificationMobileScreenLayout extends StatelessWidget {
  const TwoFaVerificationMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final TwoFaVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.twoFaVerification),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          _appLogoWidget(context),
          verticalSpace(Dimensions.heightSize * 2),
          _otpWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical,
      ),
      child: Obx(
        () => PrimaryButton(
          isLoading: controller.isLoading,
          title: Strings.submit,
          onPressed: () {
            controller.onSubmit;
          },
        ),
      ),
    );
  }

  _appLogoWidget(BuildContext context) {
    return Image.asset(
      Assets.logo.appLauncher.path,
      scale: 4,
    );
  }

  _otpWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 4),
          topRight: Radius.circular(Dimensions.radius * 4),
        ),
      ),
      child: Column(
        children: [
          const TitleSubTitleWidget(
            title: Strings.twoFactorAuthorization,
            subTitle: Strings.enterTheTwoFaVerification,
            isCenterText: true,
          ),
          _otpInputWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _otpInputWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.paddingSize * 1.5),
      child: PinCodeTextField(
        appContext: context,
        backgroundColor: Colors.transparent,
        textStyle: Get.isDarkMode
            ? CustomStyle.darkHeading2TextStyle
            : CustomStyle.lightHeading2TextStyle,
        enableActiveFill: true,
        pastedTextStyle: TextStyle(
          color: Colors.orange.shade600,
          fontWeight: FontWeight.bold,
        ),
        length: 6,
        obscureText: false,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        validator: (v) {
          if (v!.length < 3) {
            return Strings.pleaseFillOutTheField;
          } else {
            return null;
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          fieldHeight: 48,
          fieldWidth: 50,
          inactiveColor: Colors.transparent,
          activeColor: Colors.transparent,
          selectedColor: Colors.transparent,
          inactiveFillColor: Theme.of(context).colorScheme.background,
          activeFillColor: Theme.of(context).colorScheme.background,
          selectedFillColor: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        ),
        cursorColor: Theme.of(context).primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        errorAnimationController: controller.errorController,
        controller: controller.pinCodeController,
        keyboardType: TextInputType.number,
        onCompleted: (v) {},
        onChanged: (value) {
          controller.changeCurrentText(value);
        },
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
