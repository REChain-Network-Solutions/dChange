part of "make_an_offer_buying_preview_screen.dart";

class MakeAnOfferPreviewMobileScreenLayout extends StatelessWidget {
  MakeAnOfferPreviewMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final MakeAnOfferController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        MakeAnOfferRateWidget(controller: controller),
        MakeAnOfferFieldsWidget(controller: controller),
        _sendOfferButtonWidget(context),
      ],
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _sendOfferButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isLoading,
        title: Strings.sendOffer,
        onPressed: () {
          controller.onSendOffer;
        },
      ),
    );
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      leading: BackButtonWidget(
        onTap: () {
          Get.back();
        },
      ),
      title: Row(
        children: [
          TitleHeading2Widget(text: controller.sellerName.value),
          CircleAvatar(
            radius: Dimensions.radius * 0.4,
            backgroundColor: Get.isDarkMode
                ? CustomColor.whiteColor.withOpacity(0.30)
                : CustomColor.blackColor.withOpacity(0.30),
          ).paddingSymmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.2,
          ),
          TitleHeading4Widget(
            text: controller.isVerified.value
                ? Strings.verified
                : Strings.unVerified,
            color: controller.isVerified.value
                ? Theme.of(context).primaryColor
                : CustomColor.redColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
