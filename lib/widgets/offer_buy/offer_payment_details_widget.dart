import '../../controller/offer_buy/offer_buy_preview_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../common/text_labels/separate_double_text_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class OfferPaymentDetailsWidget extends StatelessWidget {
  const OfferPaymentDetailsWidget({super.key, required this.controller});
  final OfferBuyPreviewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _transactionSummaryWidget(context),
      ],
    );
  }

  _transactionSummaryWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
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
            secondText: controller.subTotal.value,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.feesAndCharge,
            secondText: controller.charge.value,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.total,
            secondText: controller.willPay.value,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.payableAmount,
            secondText: controller.sellerWillPay.value,
          ),
        ],
      ),
    );
  }
}
