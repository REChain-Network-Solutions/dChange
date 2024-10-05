part of 'money_out_screen.dart';

class MoneyOuMobileScreenLayout extends StatelessWidget {
  const MoneyOuMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final MoneyOutController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.moneyOut),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _inputFieldWidget(context),
        _paymentGatewayWidget(context),
        _customNumKeyBoardWidget(context),
        _buttonWidget(context)
      ],
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: Dimensions.marginSizeHorizontal * 0.5,
        top: Dimensions.marginSizeVertical * 2,
      ),
      alignment: Alignment.topCenter,
      height: Dimensions.inputBoxHeight,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: Dimensions.widthSize * 0.7),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      style: Get.isDarkMode
                          ? CustomStyle.lightHeading2TextStyle.copyWith(
                              fontSize: Dimensions.headingTextSize3 * 2,
                            )
                          : CustomStyle.darkHeading2TextStyle.copyWith(
                              color: CustomColor.primaryLightTextColor,
                              fontSize: Dimensions.headingTextSize3 * 2,
                            ),
                      readOnly: true,
                      controller: controller.moneyOutAmountTextController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^-?\d*\.?\d*)')),
                        LengthLimitingTextInputFormatter(
                          6,
                        ), //max length of 12 characters
                      ],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return Strings.pleaseFillOutTheField;
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: '0.0',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.widthSize * 0.5,
                ),
              ],
            ),
          ),
          SizedBox(width: Dimensions.widthSize * 0.7),
          _currencyDropDownWidget(context),
        ],
      ),
    );
  }

  _customNumKeyBoardWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 3 / 1.5,
        shrinkWrap: true,
        children: List.generate(
          controller.keyboardItemList.length,
          (index) {
            return controller.inputItem(index);
          },
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.marginSizeHorizontal * 0.8,
        right: Dimensions.marginSizeHorizontal * 0.8,
        top: Platform.isAndroid ? Dimensions.marginSizeVertical * 1.8 : 0.0,
        bottom: Dimensions.marginSizeVertical,
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => PrimaryButton(
                isLoading: controller.isInsertLoading,
                title: Strings.moneyOut,
                onPressed: () {
                  controller.manualPaymentGetGatewaysProcess();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _currencyDropDownWidget(BuildContext context) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 2.5),
      ),
      label: Row(
        children: [
          CircleAvatar(
            radius: Dimensions.radius * 1.3,
            backgroundImage: NetworkImage(controller.baseCurrencyFlag.value),
          ),
          horizontalSpace(Dimensions.widthSize * 0.5),
          TitleHeading3Widget(
            text: controller.baseCurrency.value,
            color: CustomColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  _paymentGatewayWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.5),
        Obx(
          () => TitleHeading5Widget(
            text:
                "${Get.find<LanguageController>().getTranslation(Strings.limit)} ${controller.limitMin.value.toStringAsFixed(2)} ${controller.baseCurrency.value} - ${controller.limitMax.value.toStringAsFixed(2)} ${controller.baseCurrency.value} ",
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Obx(() => Container(
              margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 1.8),
              height: Dimensions.inputBoxHeight * 0.6,
              child: CustomDropDown<Currency>(
                items: controller.allCurrencyList,
                hint: controller.selectWallet.value,
                onChanged: (value) {
                  dynamic rateValue = 1.0;
                  controller.selectWallet.value = value!.title;
                  controller.currencyCode.value = value.currencyCode;
                  controller.selectAlias.value = value.alias;
                  controller.selectedCurrencyType.value = value.type;
                  controller.rate.value = value.rate;
                  controller.limitMin.value = value.minLimit / value.rate;
                  controller.exchangeRate.value = (rateValue / value.rate);
                  controller.limitMax.value = value.maxLimit / value.rate;
                  controller.currencyCode.value = value.currencyCode;
                  debugPrint(
                      "---------------${controller.selectWallet.value}, ${controller.selectAlias.value} ${controller.selectedCurrencyType.value}  ${controller.rate.value}-----------");
                },
                isExpanded: false,
                padding: EdgeInsets.only(
                  left: Dimensions.paddingSize * 0.25,
                ),
                titleTextColor: Theme.of(context).colorScheme.background,
                titleStyle: Get.isDarkMode
                    ? CustomStyle.lightHeading3TextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      )
                    : CustomStyle.darkHeading3TextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                dropDownColor: Theme.of(context).primaryColor,
                dropDownFieldColor: Theme.of(context).primaryColor,
                dropDownIconColor: Theme.of(context).colorScheme.background,
                customBorderRadius:
                    BorderRadius.circular(Dimensions.radius * 4),
              ),
            )),
      ],
    );
  }
}
