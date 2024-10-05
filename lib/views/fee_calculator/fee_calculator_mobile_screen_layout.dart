part of '../fee_calculator/fee_calculator_screen.dart';

class FeeCalculatorMobileScreenLayout extends StatelessWidget {
  FeeCalculatorMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final FeeCalculatorController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.feeCalculator),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
      ),
      child: Column(
        mainAxisSize: mainMin,
        crossAxisAlignment: crossStart,
        children: [
          _titleWidget(context),
          _inputFieldsWidget(context),
        ],
      ),
    );
  }

  _titleWidget(context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        const TitleHeading5Widget(
          text: Strings.calculateNow,
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
      ],
    );
  }

  _inputFieldsWidget(context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: PrimaryInputWidget(
            controller: controller.amountController,
            hintText: '0.00',
            label: Strings.amount,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            suffixIcon: CurrencyDropDown(feeCalculator: true),
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
              LengthLimitingTextInputFormatter(
                6,
              ),
            ],
            onChanged: (value) {
              controller.onCalculateProcess;
            },
          ),
        ),
        //_buttonWidget(context),
        verticalSpace(Dimensions.marginBetweenInputBox),
        PrimaryInputWidget(
          controller: controller.feeController,
          hintText: '0.00',
          label: Strings.tradeFee,
          readOnly: true,
          suffixIcon: IgnorePointer(
            child: CurrencyDropDown(
              isSellCurrency: false,
              isDropDownIcon: false,
            ),
          ),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
