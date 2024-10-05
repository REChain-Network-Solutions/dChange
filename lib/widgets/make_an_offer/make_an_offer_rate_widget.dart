part of "../../views/make_an_offer/make_an_offer_buying_preview_screen.dart";

class MakeAnOfferRateWidget extends StatelessWidget {
  const MakeAnOfferRateWidget({super.key, required this.controller});
  final MakeAnOfferController controller;
  @override
  Widget build(BuildContext context) {
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
            color: Get.isDarkMode
                ? CustomColor.whiteColor.withOpacity(0.4)
                : CustomColor.blackColor.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
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
    );
  }
}
