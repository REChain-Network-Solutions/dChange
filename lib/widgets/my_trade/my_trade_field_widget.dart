part of '../../views/my_section/my_section_screen.dart';

class MyTradeFieldWidget extends StatelessWidget {
  const MyTradeFieldWidget({super.key, required this.controller});
  final MySectionController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _startTransactionWidget(context),
        _tradeLimitWidget(context),
      ],
    );
  }

  _startTransactionWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginBetweenInputTitleAndBox),
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
            text: Strings.startTransaction,
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
            suffixIcon: CurrencyDropDown(),
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
              LengthLimitingTextInputFormatter(
                20,
              ), //max length of 20 characters
            ],
          ).paddingSymmetric(vertical: Dimensions.marginSizeVertical * 0.666),
          PrimaryInputWidget(
            controller: controller.rateController,
            hintText: '0.00',
            label: Strings.rate,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
              LengthLimitingTextInputFormatter(
                20,
              ), //max length of 20 characters
            ],
            suffixIcon: CurrencyDropDown(
              isSellCurrency: false,
            ),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }

  _tradeLimitWidget(BuildContext context) {
    return Obx(() {
      String limit =
          "${Get.find<LanguageController>().getTranslation(Strings.limit)} ${controller.tardeMin.value} ${controller.sellCurrency.value} - ${controller.tardeMax.value} ${controller.sellCurrency.value}";
      return Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.marginBetweenInputTitleAndBox),
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
              text: Strings.tradeLimit,
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
            TitleHeading5Widget(
              text: limit,
              opacity: 0.60,
            ).paddingSymmetric(vertical: Dimensions.marginSizeVertical * 0.3),
          ],
        ),
      );
    });
  }
}
