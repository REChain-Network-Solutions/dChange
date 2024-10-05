import 'package:dchange/controller/money_out/money_out_controller.dart';
import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:dchange/widgets/common/amount_widget.dart';
import '../common/text_labels/separate_double_text_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class WithdrawCustomPreviewWidget extends StatelessWidget {
  WithdrawCustomPreviewWidget({super.key});
  final controller = Get.put(MoneyOutController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _enteredAmountWidget(context),
        _transactionSummaryWidget(context),
      ],
    );
  }

  _enteredAmountWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 3.33,
        vertical: Dimensions.marginSizeVertical * 1.5,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
        ),
      ),
      child: Column(
        children: [
          AmountWidget(
            amount: controller.enteredAmount,
            currency: '',
            isPrimaryColor: true,
          ),
          verticalSpace(Dimensions.marginSizeVertical * 0.5),
          const TitleHeading4Widget(
            text: Strings.enteredAmount,
            opacity: 0.60,
          )
        ],
      ),
    );
  }

  _transactionSummaryWidget(BuildContext context) {
    final data = controller.moneyOutInsertModel.data.paymentInformations;
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
            firstText: Strings.enteredAmount,
            secondText: data.requestAmount,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.feesAndCharge,
            secondText: data.totalCharge,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.total,
            secondText: data.willGet,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.payableAmount,
            secondText: data.payable,
          ),
        ],
      ),
    );
  }
}
