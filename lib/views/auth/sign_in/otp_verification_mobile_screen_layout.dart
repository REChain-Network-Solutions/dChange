part of '../sign_in/otp_verification_screen.dart';

class OtpVerificationMobileScreenLayout extends StatelessWidget {
  const OtpVerificationMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final OtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.oTPVerification),
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
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
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
            title: Strings.pleaseEnterTheCode,
            subTitle: Strings.enterTheOtpVerification,
            isCenterText: true,
          ),
          _otpInputWidget(context),
          _timeWidget(context),
          _buttonWidget(context),
          _resendButton(context),
        ],
      ),
    );
  }

  _timeWidget(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.only(
          top: Dimensions.paddingSize,
          bottom: Dimensions.paddingSize,
        ),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              Icons.watch_later_outlined,
              color: Theme.of(context).primaryColor,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            TitleHeading4Widget(
              text: controller.secondsRemaining.value >= 0 &&
                      controller.secondsRemaining.value <= 9
                  ? '00:0${controller.secondsRemaining.value}'
                  : '00:${controller.secondsRemaining.value}',
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }

  _resendButton(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.enableResend.value,
        child: InkWell(
          onTap: () {
            controller.resendCode();
          },
          child: const TitleHeading4Widget(text: Strings.resendCode),
        ),
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
