part of '../my_section/my_selling_preview_screen.dart';

class SellingPreviewMobileScreenLayout extends StatelessWidget {
  SellingPreviewMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final MySellingPreviewController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.preview),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.75),
      physics: const BouncingScrollPhysics(),
      children: [
        SellingRateWithGatewayWidget(controller: controller),
        SellingPaymentDetailsWidget(controller: controller),
        _confirmButtonWidget()
      ],
    );
  }

  _confirmButtonWidget() {
    return Obx(
      () => PrimaryButton(
        title: Strings.confirm,
        isLoading: controller.isLoading,
        onPressed: () {
          controller.onConfirm;
        },
      ),
    );
  }
}
