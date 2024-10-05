part of '../../views/my_section/my_section_screen.dart';

class ExchangeRateWidget extends StatelessWidget {
  const ExchangeRateWidget({super.key, required this.controller});
  final MySectionController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 2,
          vertical: Dimensions.marginSizeHorizontal * 1.291,
        ),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
        ),
        child: Column(
          children: [
            const TitleHeading3Widget(
              text: Strings.exchangeRate,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
            FittedBox(
              child: Row(
                mainAxisAlignment: mainCenter,
                children: [
                  AmountWidget(
                    amount: controller.sellAmount.value.toString(),
                    currency: controller.sellCurrency.value,
                  ),
                  const TitleHeading1Widget(text: '=').paddingSymmetric(
                    horizontal: Dimensions.marginSizeHorizontal * 0.2,
                  ),
                  AmountWidget(
                    amount: controller.rateAmount.value.toStringAsFixed(2),
                    currency: controller.rateCurrency.value,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
