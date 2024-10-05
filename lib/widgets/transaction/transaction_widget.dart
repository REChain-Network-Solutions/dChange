// ignore_for_file: prefer_const_constructors

part of '../../views/transaction/transactions_screen.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({super.key, required this.data});
  final LatestTransaction data;
  // final controller = Get.put(TradeEditController());
  @override
  Widget build(BuildContext context) {
    final dateOnly = DateFormat('dd');
    final monthOnly = DateFormat('MMM');
    return Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.65),
        decoration: ShapeDecoration(
          color: Get.isDarkMode
              ? CustomColor.primaryBGDarkColor
              : CustomColor.primaryBGLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    TitleHeading1Widget(
                      text: dateOnly.format(data.createdAt),
                      fontWeight: FontWeight.w700,
                    ),
                    TitleHeading4Widget(
                      text: monthOnly.format(data.createdAt),
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
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Row(
                      children: [
                        AmountWidget(
                          amount: data.buyerWillGet,
                          currency: data.saleCurrency,
                          isPrimaryColor: true,
                          fontSize: Dimensions.headingTextSize4,
                        ),
                        CustomImageWidget(
                          path: Assets.icon.replyTeal,
                          color: Theme.of(context).primaryColor,
                        ),
                        AmountWidget(
                          amount: data.buyerWillPay,
                          currency: data.rateCurrency,
                          isPrimaryColor: true,
                          fontSize: Dimensions.headingTextSize4,
                        ),
                      ],
                    ),
                    verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                    Row(
                      children: [
                        TitleHeading5Widget(
                          text: data.trx,
                          opacity: 0.30,
                        ),
                        statusInfo(data.status),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        )).marginOnly(
      bottom: Dimensions.marginBetweenInputTitleAndBox * 0.5,
    );
  }

  statusInfo(status) {
    switch (data.status) {
      case 'Ongoing':
        return _customStatusWidget(color: CustomColor.orangeColor);
      case 'Pending':
        return _customStatusWidget(color: CustomColor.orangeColor);
      case 'Rejected':
        return _customStatusWidget(color: CustomColor.redColor);
      case 'Complete':
        return _customStatusWidget(color: CustomColor.greenColor);
      case 'Success':
        return _customStatusWidget(color: CustomColor.greenColor);
      case 'Close Request':
        return _customStatusWidget(color: CustomColor.redColor);
      case 'Closed':
        return _customStatusWidget(color: CustomColor.redColor);
      default:
        return _customStatusWidget(color: CustomColor.redColor);
    }
  }

  _customStatusWidget({required Color color}) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.widthSize * 0.4),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        color: color.withOpacity(0.2),
      ),
      child: TitleHeading5Widget(
        text: data.status,
        fontSize: Dimensions.headingTextSize6,
        color: color,
      ),
    );
  }
}
