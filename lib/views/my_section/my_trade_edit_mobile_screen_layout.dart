part of 'my_trade_edit_screen.dart';

class TradeEditMobileScreenLayout extends StatelessWidget {
  TradeEditMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final TradeEditController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar("${Strings.trade} ${Strings.edit}"),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ExchangeRateWithInputFieldWidget(controller: controller),
          Obx(
            () => PrimaryButton(
              isLoading: controller.isUpdateLoading,
              title: Strings.update,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.onUpdate;
                }
              },
            ),
          ).paddingSymmetric(
            vertical: Dimensions.marginSizeVertical,
            horizontal: Dimensions.marginSizeHorizontal * 0.2,
          ),
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.75),
    );
  }
}
