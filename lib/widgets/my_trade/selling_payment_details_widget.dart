part of '../../views/my_section/my_selling_preview_screen.dart';

class SellingPaymentDetailsWidget extends StatelessWidget {
  const SellingPaymentDetailsWidget({super.key, required this.controller});
  final MySellingPreviewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _yourDetailsWidget(context),
        _transactionSummaryWidget(context),
      ],
    );
  }

  _yourDetailsWidget(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: const [
              TitleHeading5Widget(
                text: Strings.yourDetails,
                opacity: 0.60,
              ),
              // InkWell(
              //   onTap: () {
              //     controller.onUserInfoEdit;
              //   },
              //   child: Row(
              //     mainAxisAlignment: mainEnd,
              //     crossAxisAlignment: crossEnd,
              //     children: [
              //       CustomImageWidget(
              //         path: Assets.icon.edit,
              //         height: Dimensions.heightSize * 0.8,
              //       ),
              //       horizontalSpace(Dimensions.widthSize * 0.1),
              //       TitleHeading5Widget(
              //         text: Strings.edit,
              //         color: Theme.of(context).primaryColor,
              //       ),
              //     ],
              //   ),
              // ),
            ],
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
          SeparateDoubleTextWidget(
            firstText: Strings.name,
            secondText: LocalStorage.getName(),
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.emailAddress,
            secondText: LocalStorage.getEmail(),
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.phoneNumber,
            secondText: LocalStorage.getNumber(),
          ),
        ],
      ),
    );
  }

  _transactionSummaryWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginBetweenInputTitleAndBox,
        bottom: Dimensions.marginSizeVertical,
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
            text: Strings.transactionsSummary,
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
          SeparateDoubleTextWidget(
            firstText: Strings.subTotal,
            secondText:
                '${controller.subTotal.value} ${controller.rateCurrency.value}',
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.feesAndCharge,
            secondText:
                '${controller.charge.value} ${controller.rateCurrency.value}',
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.total,
            secondText:
                '${controller.total.value} ${controller.rateCurrency.value}',
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.payableAmount,
            secondText:
                '${controller.payableAmount.value} ${controller.rateCurrency.value}',
          ),
        ],
      ),
    );
  }
}
