part of '../../views/make_counter_offer/make_counter_screen.dart';

class MakeCounterOfferFieldsWidget extends StatelessWidget {
  const MakeCounterOfferFieldsWidget({super.key, required this.controller});
  final MakeCounterOfferController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      margin: EdgeInsets.only(
        top: Dimensions.marginBetweenInputTitleAndBox,
        bottom: Dimensions.marginSizeVertical,
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
              text: Strings.makeCounterOffer,
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
            PrimaryInputWidget(
              controller: controller.amountController,
              hintText: '0.00',
              label: Strings.amount,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              readOnly: true,
              suffixIcon: _customCurrencyWidget(controller.sellCurrency.value),
            ).paddingSymmetric(vertical: Dimensions.marginSizeVertical * 0.666),
            PrimaryInputWidget(
              controller: controller.rateController,
              hintText: '0.00',
              label: Strings.rate,
              suffixIcon: _customCurrencyWidget(controller.rateCurrency.value),
              fillColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }

  _customCurrencyWidget(currency) {
    return Container(
      width: Dimensions.widthSize * 8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius * 0.5),
          bottomRight: Radius.circular(Dimensions.radius * 0.5),
        ),
        color: Theme.of(Get.context!).primaryColor,
      ),
      child: Text(
        currency,
        style: Get.isDarkMode
            ? CustomStyle.lightHeading3TextStyle.copyWith(
                fontWeight: FontWeight.w500,
              )
            : CustomStyle.darkHeading3TextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
      ),
    );
  }
}
