import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:dchange/widgets/common/amount_widget.dart';

import '../../controller/add_money/add_money_controller.dart';
import '../common/text_labels/separate_double_text_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class CustomPreviewWidget extends StatelessWidget {
  CustomPreviewWidget({super.key});
  final controller = Get.put(AddMoneyController());
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
            secondText: controller.enteredAmount,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.feesAndCharge,
            secondText: controller.totalCharge,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.total,
            secondText: controller.youWillGet,
          ),
          SeparateDoubleTextWidget(
            firstText: Strings.payableAmount,
            secondText: controller.payableAmount,
          ),
        ],
      ),
    );
  }
}
