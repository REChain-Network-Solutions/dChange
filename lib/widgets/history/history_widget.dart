// ignore_for_file: prefer_const_constructors, unnecessary_to_list_in_spreads

part of '../../views/history/history_screen.dart';

class HistoryWidget extends StatelessWidget {
  HistoryWidget({
    super.key,
    required this.data,
    required this.index,
    this.isIgnore = false,
  });
  final Transactionss data;
  final controller = Get.put(AddMoneyController());
  final int index;
  final bool isIgnore;
  @override
  Widget build(BuildContext context) {
    var day = DateFormat('dd');
    var month = DateFormat('MMM');
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
      decoration: ShapeDecoration(
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        ),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: IgnorePointer(
          ignoring: isIgnore,
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            onExpansionChanged: (value) {
              if (value == true) {
                controller.inputFieldControllers.clear();
                controller.inputFields.clear();
                final metaData = data.dynamicInputs;
                for (int item = 0; item < metaData.length; item++) {
                  var textEditingController = TextEditingController();
                  controller.inputFieldControllers.add(textEditingController);
                  controller.inputFields.add(
                    Column(
                      children: [
                        PrimaryInputWidget(
                          controller: controller.inputFieldControllers[item],
                          label: metaData[item].label,
                          hintText: metaData[item].placeholder,
                          isValidator: metaData[item].required,
                          isFilled: false,
                          showBorderSide: true,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                              int.parse(
                                  metaData[item].validation.max.toString()),
                            ),
                          ],
                        ),
                        verticalSpace(Dimensions.heightSize),
                      ],
                    ),
                  );
                }
              } else {
                controller.inputFieldControllers.clear();
                controller.inputFields.clear();
              }
            },
            leading: Row(
              mainAxisSize: mainMin,
              children: [
                Column(
                  children: [
                    TitleHeading2Widget(
                      text: day.format(data.createdAt),
                      fontWeight: FontWeight.w700,
                    ),
                    TitleHeading4Widget(
                      text: month.format(data.createdAt),
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Container(
                  height: Dimensions.heightSize * 3,
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal * 0.45,
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.5,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: CustomColor.blackColor.withOpacity(0.20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  children: [
                    TitleHeading3Widget(text: data.transactionType),
                  ],
                ),
                verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                TitleHeading5Widget(
                  text: data.trx,
                  opacity: 0.30,
                )
              ],
            ),
            trailing: TitleHeading3Widget(
              text: data.requestAmount,
              color: Theme.of(context).primaryColor,
            ),
            children: [
              ExpendedItemWidget(
                title: Strings.transactionId.tr,
                value: data.trx,
              ),
              ExpendedItemWidget(
                title: Strings.exchangeRate.tr,
                value: data.exchangeRate,
              ),
              ExpendedItemWidget(
                title: Strings.feesAndCharge.tr,
                value: data.totalCharge,
              ),
              ExpendedItemWidget(
                title: Strings.timeAndDate.tr,
                value: DateFormat('yyyy-MM-dd').format(data.createdAt),
              ),
              _tatumInputField(data, context, index),
            ],
          ),
        ),
      ),
    );
  }

  _tatumInputField(Transactionss data, context, int index) {
    return Visibility(
      visible: data.status == 'Waiting' && data.confirm == true,
      child: Obx(
        () => Column(
          children: [
            verticalSpace(Dimensions.heightSize * 0.5),
            if (data.status == 'Waiting' && data.confirm == true) ...[
              ...controller.inputFields.map((element) {
                return element;
              }).toList(),
              Obx(
                () => controller.isTatumConfirmLoading
                    ? const CustomLoadingAPI(
                        color: CustomColor.primaryLightColor,
                      )
                    : PrimaryButton(
                        title: Strings.proceed,
                        borderColor: CustomColor.primaryLightColor,
                        buttonColor: CustomColor.primaryLightColor,
                        onPressed: () {
                          controller.tatumConfirmTransactionProcess(
                            context,
                            data.confirmUrl,
                            index,
                          );
                        },
                      ),
              ),
              verticalSpace(Dimensions.heightSize),
            ],
          ],
        ),
      ),
    );
  }
}
