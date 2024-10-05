// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../backend/model/currency/currency_model.dart';
import '../../../controller/currency/currency_controller.dart';
import '../../../controller/fee_calculator/fee_calculator_controller.dart';
import '../custom_drop_down/custom_drop_down.dart';
import '/controller/my_section/my_section_controller.dart';
import '/utils/basic_screen_imports.dart';

class Currency implements DropdownModel {
  @override
  @override
  @override
  String title, img;
  Currency({
    required this.img,
    required this.title,
  });
}

class CurrencyDropDown extends StatelessWidget {
  CurrencyDropDown({
    super.key,
    this.isSellCurrency = true,
    this.isRounded = false,
    this.isDropDownIcon = true,
    this.isDialogField = false,
    this.feeCalculator = false,
  });
  final bool isSellCurrency,
      isRounded,
      isDropDownIcon,
      isDialogField,
      feeCalculator;
  final controller = Get.put(CurrencyController());
  final feeCalculatorController = Get.put(FeeCalculatorController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? Container()
          : SizedBox(
              height: isDialogField
                  ? Dimensions.inputBoxHeight * 0.6
                  : Dimensions.inputBoxHeight * (isRounded ? 0.6 : 0.4),
              child: CustomDropDown<ECurrency>(
                borderEnable: isDialogField ? false : true,
                items: isSellCurrency
                    ? controller.currencyModel.data.saleCurrency
                    : controller.currencyModel.data.rateCurrency,
                hint: isSellCurrency
                    ? controller.sellCurrency.value
                    : controller.rateCurrency.value,
                onChanged: (value) {
                  if (feeCalculator) {
                    controller.sellCurrency.value = value!.code;
                    controller.sellCurrencyId.value = value.id.toString();
                    feeCalculatorController.getTradeFeApiProcess();
                  }
                  final tradeController = Get.put(MySectionController());
                  if (isSellCurrency) {
                    controller.sellCurrency.value = value!.code;
                    controller.sellCurrencyId.value = value.id.toString();
                    tradeController.sellCurrency.value = value.code;

                    /// get exchange rate
                    double sellCurrencyRate = double.parse(value.rate);
                    tradeController.rateAmount.value =
                        (1.00 / sellCurrencyRate);

                    /// get trade min max rate
                    controller.updateMinMaxRate(sellCurrencyRate);
                  } else {
                    controller.rateCurrency.value = value!.code;
                    controller.rateCurrencyId.value = value.id.toString();
                    tradeController.rateCurrency.value = value.code;
                  }
                },
                isExpanded: isDialogField ? true : false,
                padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.15,
                  right: Dimensions.paddingSize * 0.15,
                ),
                titleTextColor: isDialogField
                    ? CustomColor.blackColor.withOpacity(0.2)
                    : Theme.of(context).colorScheme.background,
                titleStyle: isDialogField
                    ? CustomStyle.lightHeading3TextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.blackColor.withOpacity(0.2),
                      )
                    : Get.isDarkMode
                        ? CustomStyle.lightHeading3TextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          )
                        : CustomStyle.darkHeading3TextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                dropDownColor: isDialogField
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).primaryColor,
                dropDownFieldColor: isDialogField
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).primaryColor,
                dropDownIconColor: isDialogField
                    ? CustomColor.blackColor.withOpacity(0.2)
                    : isDropDownIcon
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).primaryColor,
                customBorderRadius: isDialogField
                    ? null
                    : isRounded
                        ? BorderRadius.circular(Dimensions.radius * 4)
                        : BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius * 0.5),
                            bottomRight:
                                Radius.circular(Dimensions.radius * 0.5),
                          ),
              ),
            ),
    );
  }
}
