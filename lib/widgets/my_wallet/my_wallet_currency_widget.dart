import 'package:dchange/custom_assets/assets.gen.dart';
import 'package:dchange/utils/basic_widget_imports.dart';
import 'package:dchange/widgets/common/amount_widget.dart';
import 'package:dchange/widgets/common/others/custom_image_widget.dart';

import '../../controller/my_wallet/my_wallet_controller.dart';
import 'last_transaction_widget.dart';

class MyWalletCurrencyWidget extends StatelessWidget {
  const MyWalletCurrencyWidget({super.key, required this.controller});
  final MyWalletController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _walletWidget(context),
        LastTransactionWidget(controller: controller),
        _currencyFlagWidget(context)
      ],
    );
  }

  _walletWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.13),
      height: MediaQuery.sizeOf(context).height * 0.71,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          ),
        ),
      ),
      child: Column(
        children: [
          _amountAndCurrencyWidget(context),
          _topicButtonWidget(context)
        ],
      ),
    );
  }

  _amountAndCurrencyWidget(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AmountWidget(
            amount: controller.controller.walletBalance.value,
            currency: controller.controller.walletCurrency.value,
            fontSize: Dimensions.headingTextSize3 * 1.5,
          ),
          TitleHeading3Widget(
            text: controller.controller.walletCurrencySubTitle.value,
            opacity: 0.60,
          ).paddingOnly(top: Dimensions.marginBetweenInputTitleAndBox)
        ],
      ),
    ).paddingOnly(top: Dimensions.marginSizeVertical * 2.5);
  }

  _topicButtonWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainCenter,
      children: [
        buttonSwitch(Types.addMoney),
        horizontalSpace(Dimensions.widthSize * 2),
        buttonSwitch(Types.history),
        horizontalSpace(Dimensions.widthSize * 2),
        buttonSwitch(Types.moneyOut),
      ],
    ).paddingSymmetric(
      horizontal: Dimensions.marginSizeHorizontal * 1.5,
      vertical: Dimensions.marginSizeVertical * 1.2,
    );
  }

  buttonSwitch(type) {
    switch (type) {
      case Types.addMoney:
        return _buildButton(
          icon: Assets.icon.computer,
          onTap: () {
            controller.onAddMoney;
          },
          title: Strings.addMoney,
        );
      case Types.moneyOut:
        return _buildButton(
          icon: Assets.icon.myWallet,
          onTap: () {
            controller.onMoneyOut;
          },
          title: Strings.moneyOut,
        );
      case Types.history:
        return _buildButton(
          icon: Assets.icon.menuWhite,
          onTap: () {
            controller.onHistory;
          },
          title: Strings.history,
        );
    }
  }

  _buildButton({
    required onTap,
    required icon,
    required title,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          CircleAvatar(
            backgroundColor: CustomColor.primaryDarkColor,
            radius: Dimensions.radius * 2.5,
            child: CustomImageWidget(path: icon),
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          TitleHeading4Widget(
            text: title,
            opacity: 0.60,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _currencyFlagWidget(BuildContext context) {
    return Positioned(
      top: 50,
      child: Container(
        width: 89.w,
        height: 89.h,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              width: 2.82,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 11.27,
              offset: Offset(0, 4.51),
              spreadRadius: 0,
            )
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundImage:
              NetworkImage(controller.controller.baseCurrencyFlag.value),
        ),
      ),
    );
  }
}

enum Types { addMoney, moneyOut, history }
