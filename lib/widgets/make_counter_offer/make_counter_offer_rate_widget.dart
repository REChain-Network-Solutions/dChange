part of "../../views/make_counter_offer/make_counter_screen.dart";

class MakeCounterOfferRateWidget extends StatelessWidget {
  const MakeCounterOfferRateWidget({super.key, required this.controller});
  final MakeCounterOfferController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_rateWidget(context), _priceOfferWidget(context)],
    );
  }

  _priceOfferWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      margin: EdgeInsets.only(
        top: Dimensions.marginBetweenInputTitleAndBox,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            const TitleHeading5Widget(
              text: Strings.priceOffer,
              opacity: 0.60,
            ),
            Container(
              height: 2,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: Dimensions.marginBetweenInputTitleAndBox,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            verticalSpace(Dimensions.marginSizeVertical * 0.75),
            _offerPriceWidget(
              Strings.offer,
              controller.sellAmount.value.toStringAsFixed(2),
              controller.rateAmount.value.toStringAsFixed(2),
            ),
            verticalSpace(Dimensions.marginSizeVertical * 0.5),
            _offerPriceWidget(
              Strings.counterOffer,
              controller.counterSellAmount.value.toStringAsFixed(2),
              controller.counterRateAmount.value.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }

  _offerPriceWidget(
    String title,
    sellAmount,
    rateAmount,
  ) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Expanded(
          child: TitleHeading4Widget(
            text: title,
            opacity: 0.60,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            mainAxisAlignment: mainCenter,
            children: [
              Opacity(
                opacity: 0.60,
                child: AmountWidget(
                  amount: sellAmount,
                  currency: controller.sellCurrency.value,
                  fontSize: Dimensions.headingTextSize3 * 0.8,
                ),
              ),
              CustomImageWidget(
                path: Assets.icon.replyTeal,
                color: Get.isDarkMode
                    ? CustomColor.whiteColor.withOpacity(0.60)
                    : CustomColor.blackColor.withOpacity(0.60),
              ).paddingSymmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.1,
              ),
              Opacity(
                opacity: 0.60,
                child: AmountWidget(
                  amount: rateAmount,
                  currency: controller.rateCurrency.value,
                  fontSize: Dimensions.headingTextSize3 * 0.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _rateWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal,
        vertical: Dimensions.marginSizeVertical * 1.83,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        shadows: [
          BoxShadow(
            color: CustomColor.blackColor.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            AmountWidget(
              amount: controller.sellAmount.value.toStringAsFixed(2),
              currency: controller.sellCurrency.value,
              isPrimaryColor: true,
            ),
            CustomImageWidget(
              path: Assets.icon.replyTeal,
              color: Get.isDarkMode
                  ? CustomColor.whiteColor
                  : CustomColor.blackColor,
            ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.2),
            AmountWidget(
              amount: controller.rateAmount.value.toStringAsFixed(2),
              currency: controller.rateCurrency.value,
              isPrimaryColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
