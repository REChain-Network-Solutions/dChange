part of 'add_money_preview_screen.dart';

class AddMoneyPreviewMobileScreenLayout extends StatelessWidget {
  const AddMoneyPreviewMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final AddMoneyPreviewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.preview),
      body: Column(
        children: [
          CustomPreviewWidget(),
          _confirmButtonWidget(context),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }

  _confirmButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.controller.isConfirmLoading,
        title: Strings.confirm,
        onPressed: () {
          controller.onConfirm;
        },
      ),
    );
  }
}
