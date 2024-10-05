part of 'money_out_preview_screen.dart';

class MoneyOutPreviewMobileScreenLayout extends StatelessWidget {
  MoneyOutPreviewMobileScreenLayout({
    super.key,
  });

  final controller = Get.put(MoneyOutController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.preview),
      body: Column(
        children: [
          WithdrawCustomPreviewWidget(),
          _confirmButtonWidget(context),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }

  _confirmButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isConfirmLoading,
        title: Strings.confirm,
        onPressed: () {
          controller.confirmProcess();
        },
      ),
    );
  }
}
