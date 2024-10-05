part of "make_counter_screen.dart";

class MakeCounterOfferMobileScreenLayout extends StatelessWidget {
  final MakeCounterOfferController controller;

  final formKey = GlobalKey<FormState>();
  MakeCounterOfferMobileScreenLayout({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: _bodyWidget(context),
    );
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      leading: BackButtonWidget(
        onTap: () {
          // Get.back();
          Get.close(1);
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
            text: Strings.verified,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        MakeCounterOfferRateWidget(controller: controller),
        if (controller.isCounterOffer.value) ...[
          MakeCounterOfferFieldsWidget(controller: controller),
          _makeAnOfferButtonWidget(context),
          _rejectButtonWidget(context),
        ]
      ],
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _makeAnOfferButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isLoading,
        title: Strings.makeCounterOffer,
        buttonColor: CustomColor.orangeColor,
        borderColor: CustomColor.orangeColor,
        onPressed: () {
          controller.onCounterOffer;
        },
      ),
    );
  }

  _rejectButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.reject,
      buttonColor: Colors.transparent,
      borderColor: CustomColor.redColor,
      borderWidth: 2,
      elevation: 0,
      buttonTextColor: CustomColor.redColor,
      onPressed: () {
        controller.offerStatusProcessApi('Reject');
      },
    ).paddingOnly(
      top: Dimensions.marginBetweenInputTitleAndBox,
      bottom: Dimensions.marginSizeVertical,
    );
  }
}
