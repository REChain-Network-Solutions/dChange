// ignore_for_file: public_member_api_docs, sort_constructors_first

part of '../transaction/transactions_screen.dart';

class TransactionMobileScreenLayout extends StatelessWidget {
  const TransactionMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final TransactionController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.transactions),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return AnimationLimiter(
      child: controller.marketplaceTrxModel.data.latestTransaction.isEmpty
          ? const Center(
              child: TitleHeading3Widget(text: Strings.noTransactionFound))
          : ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount:
                  controller.marketplaceTrxModel.data.latestTransaction.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListViewAnimation(
                  index: index,
                  child: TransactionWidget(
                      data: controller
                          .marketplaceTrxModel.data.latestTransaction[index]),
                );
              },
            ).paddingSymmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
