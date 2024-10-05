part of 'my_trade_history_screen.dart';

class MyTradeHistoryMobileScreenLayout extends StatelessWidget {
  MyTradeHistoryMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final MyTradeHistoryController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.myTrade),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        controller.getTradeInfoProcess();
      },
      child: controller.myTradeInfoModel.data.myTrade.isEmpty
          ? const Center(
              child: TitleHeading3Widget(text: Strings.noTradeFound),
            )
          : AnimationLimiter(
              child: ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.myTradeInfoModel.data.myTrade.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: MyTradeHistoryWidget(
                      myTrade: controller.myTradeInfoModel.data.myTrade[index],
                    ),
                  ),
                ),
              ),
            ).paddingSymmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
