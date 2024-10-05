import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/my_trade/trade_info_model.dart';
import '../../controller/my_section/tarde_edit_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_screen_imports.dart';
import '../common/amount_widget.dart';
import '../common/others/custom_image_widget.dart';
import '../common/text_labels/title_heading5_widget.dart';

class MyTradeHistoryWidget extends StatelessWidget {
  MyTradeHistoryWidget({super.key, required this.myTrade});
  final MyTrade myTrade;
  final controller = Get.put(TradeEditController());
  @override
  Widget build(BuildContext context) {
    final dateOnly = DateFormat('dd');
    final monthOnly = DateFormat('MMM');
    return Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            horizontalSpace(Dimensions.widthSize * 0.5),
            SlidableAction(
              onPressed: (value) {
                LocalStorage.saveForexcrowID(
                    id: myTrade.forexcrowId.toString());
                controller.getTradeEditInfoProcess();
              },
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: CustomColor.whiteColor,
              icon: Icons.edit,
              label: Strings.edit,
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            SlidableAction(
              onPressed: (value) {
                LocalStorage.saveTradeID(id: myTrade.id.toString());
                controller.tardeCloseApiProcess();
              },
              backgroundColor: CustomColor.redColor,
              foregroundColor: CustomColor.whiteColor,
              icon: Icons.close,
              label: Strings.close,
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            ),
          ],
        ),
        child: Container(
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
                          text: dateOnly.format(myTrade.createdAt),
                          fontWeight: FontWeight.w700,
                        ),
                        TitleHeading4Widget(
                          text: monthOnly.format(myTrade.createdAt),
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
                              amount: myTrade.buyerWillGet,
                              currency: myTrade.saleCurrency,
                              isPrimaryColor: true,
                              fontSize: Dimensions.headingTextSize4,
                            ),
                            CustomImageWidget(
                              path: Assets.icon.replyTeal,
                              color: Theme.of(context).primaryColor,
                            ),
                            AmountWidget(
                              amount: myTrade.buyerWillPay,
                              currency: myTrade.rateCurrency,
                              isPrimaryColor: true,
                              fontSize: Dimensions.headingTextSize4,
                            ),
                          ],
                        ),
                        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                        Row(
                          children: [
                            TitleHeading5Widget(
                              text: myTrade.trx,
                              opacity: 0.30,
                            ),
                            statusInfo(myTrade.status),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ))).marginOnly(
      bottom: Dimensions.marginBetweenInputTitleAndBox * 0.5,
    );
  }

  statusInfo(status) {
    switch (myTrade.status) {
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
        text: myTrade.status,
        fontSize: Dimensions.headingTextSize6,
        color: color,
      ),
    );
  }
}
