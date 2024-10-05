import 'package:dchange/controller/my_wallet/my_wallet_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../utils/basic_screen_imports.dart';
import '../../views/history/history_screen.dart';
import '../animations/custom_listview_animation.dart';
import '../common/text_labels/title_heading5_widget.dart';

class LastTransactionWidget extends StatelessWidget {
  const LastTransactionWidget({super.key, required this.controller});
  final MyWalletController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainMin,
      children: [
        Row(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainSpaceBet,
          children: [
            const TitleHeading3Widget(text: Strings.lastTransaction),
            InkWell(
              onTap: () {
                controller.onTransactionViewAll;
              },
              child: TitleHeading5Widget(
                text: Strings.viewAll,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.75),
          height: MediaQuery.sizeOf(context).height * 0.3,
          child: AnimationLimiter(
            child: controller
                    .controller.addMoneyInfoModel.data.transactionss.isEmpty
                ? const Center(
                    child:
                        TitleHeading3Widget(text: Strings.noTransactionFound))
                : ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: List.generate(
                      controller.controller.addMoneyInfoModel.data.transactionss
                          .length,
                      (index) => CustomListViewAnimation(
                        index: index,
                        child: HistoryWidget(
                          data: controller.controller.addMoneyInfoModel.data
                              .transactionss[index],
                          index: index,
                          isIgnore: true,
                        ),
                      ),
                    ),
                  ),
          ),
        )
      ],
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }
}
