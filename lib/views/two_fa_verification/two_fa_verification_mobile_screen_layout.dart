// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../two_fa_verification/two_fa_verification_screen.dart';

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
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        _qrCodeWidget(context),
        _titleSubTitleWidget(context),
        _enableButtonWidget(context),
      ],
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _enableButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      child: Obx(
        () => PrimaryButton(
          isLoading: controller.isSubmitLoading,
          title:
              controller.status.value == 0 ? Strings.enable : Strings.disable,
          onPressed: () {
            controller.onEnableOrDisable;
          },
        ),
      ),
    );
  }

  _titleSubTitleWidget(BuildContext context) {
    return TitleSubTitleWidget(
      title: Strings.enable2faSecurity,
      subTitle: controller.alert.value,
      isCenterText: true,
      subTitleFontSize: Dimensions.headingTextSize4 * 0.9,
    );
  }

  _qrCodeWidget(BuildContext context) {
    return Image.network(
      controller.qrCode.value,
      scale: 1.2,
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.5);
  }
}
