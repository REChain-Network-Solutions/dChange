// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../history/history_screen.dart';

class HistoryMobileScreenLayout extends StatelessWidget {
  const HistoryMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final AddMoneyController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.history),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        controller.getAddMoneyInfoProcess();
      },
      child: AnimationLimiter(
        child: controller.addMoneyInfoModel.data.transactionss.isEmpty
            ? const Center(
                child: TitleHeading3Widget(text: Strings.noHistoryFound))
            : ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.addMoneyInfoModel.data.transactionss.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: Dimensions.marginSizeVertical * 0.4),
                      child: HistoryWidget(
                        data: controller
                            .addMoneyInfoModel.data.transactionss[index],
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
