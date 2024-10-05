part of '../../views/marketplace/marketplace_buying_preview_screen.dart';

class MarketplaceGatewayWidget extends StatelessWidget {
  const MarketplaceGatewayWidget({super.key, required this.controller});
  final MarketplaceBuyingPreviewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _amountWidget(context),
        _paymentMethodWidget(context),
      ],
    );
  }

  _amountWidget(BuildContext context) {
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
          ),
          AmountWidget(
            amount: controller.rateAmount.value.toStringAsFixed(2),
            currency: controller.rateCurrency.value,
            isPrimaryColor: true,
          ),
        ],
      ),
    );
  }

  _paymentMethodWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginBetweenInputTitleAndBox,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          const TitleHeading5Widget(
            text: Strings.paymentMethod,
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
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 2),
          CustomDropDown<PaymentGateway>(
            items: controller.marketplaceBuyModel.data.paymentGatewaies,
            hint: controller.selectPaymentGateway.value,
            onChanged: (value) {
              controller.selectPaymentGateway.value = value!.name;
              controller.selectPaymentGatewayId.value = value.id.toString();
            },
            padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.25,
            ),
            titleTextColor: CustomColor.primaryLightTextColor.withOpacity(0.30),
            dropDownColor: Theme.of(context).colorScheme.background,
            borderEnable: false,
            dropDownFieldColor: Theme.of(context).scaffoldBackgroundColor,
            dropDownIconColor:
                CustomColor.primaryLightTextColor.withOpacity(0.30),
          ),
        ],
      ),
    );
  }
}
