import 'package:dchange/controller/offer_buy/offer_buy_preview_controller.dart';
import 'package:dchange/widgets/common/custom_drop_down/custom_drop_down.dart';

import '../../backend/model/offer/offer_buy_model.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../common/amount_widget.dart';
import '../common/others/custom_image_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class OfferGatewayWidget extends StatelessWidget {
  const OfferGatewayWidget({super.key, required this.controller});
  final OfferBuyPreviewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _amountWidget(context),
        _paymentMethodWidget(context),
      ],
    );
  }

  _amountWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal,
        vertical: Dimensions.marginSizeVertical * 1.83,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        shadows: [
          BoxShadow(
            color: Get.isDarkMode
                ? CustomColor.whiteColor.withOpacity(0.4)
                : CustomColor.blackColor.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          AmountWidget(
            amount: controller.sellAmount.value.toStringAsFixed(2),
            currency: controller.sellCurrency.value,
            isPrimaryColor: true,
          ),
          CustomImageWidget(
            path: Assets.icon.replyTeal,
            color: Get.isDarkMode
                ? CustomColor.whiteColor
                : CustomColor.blackColor,
          ),
          AmountWidget(
            amount: controller.rateAmount.value.toStringAsFixed(2),
            currency: controller.rateCurrency.value,
            isPrimaryColor: true,
          ),
        ],
      ),
    );
  }

  _paymentMethodWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginBetweenInputTitleAndBox,
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
            text: Strings.paymentMethod,
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
          CustomDropDown<PaymentGateway>(
            items: controller.offerBuyModel.data.paymentGatewaies,
            hint: controller.selectPaymentGateway.value,
            onChanged: (value) {
              controller.selectPaymentGateway.value = value!.name;
              controller.selectPaymentGatewayId.value = value.id.toString();
            },
            padding: EdgeInsets.only(
              left: Dimensions.paddingSize * 0.25,
            ),
            titleTextColor: CustomColor.primaryLightTextColor.withOpacity(0.30),
            dropDownColor: Theme.of(context).primaryColor,
            borderEnable: false,
            dropDownFieldColor: Theme.of(context).scaffoldBackgroundColor,
            dropDownIconColor:
                CustomColor.primaryLightTextColor.withOpacity(0.30),
          ),
        ],
      ),
    );
  }
}
