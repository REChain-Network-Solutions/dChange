import 'package:dchange/controller/my_section/tarde_edit_controller.dart';
import 'package:flutter/services.dart';

import '../../utils/basic_screen_imports.dart';
import '../common/amount_widget.dart';
import '../common/inputs/primary_input_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class ExchangeRateWithInputFieldWidget extends StatelessWidget {
  const ExchangeRateWithInputFieldWidget({super.key, required this.controller});
  final TradeEditController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _exchangeRateWidget(context),
        _startTransactionWidget(context),
      ],
    );
  }

  _exchangeRateWidget(BuildContext context) {
    return Container(
      width: double.infinity,
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
              children: [
                AmountWidget(
                  amount: "1",
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
            readOnly: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            suffixIcon: _customCurrencyWidget(controller.sellCurrency.value),
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
              LengthLimitingTextInputFormatter(
                6,
              ), //max length of 12 characters
            ],
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
