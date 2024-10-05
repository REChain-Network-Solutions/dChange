part of '../my_section/my_section_screen.dart';

class MySectionMobileScreenLayout extends StatelessWidget {
  MySectionMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final MySectionController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ExchangeRateWidget(controller: controller),
          MyTradeFieldWidget(controller: controller),
          Obx(
            () => PrimaryButton(
              isLoading: controller.isLoading,
              title: Strings.proceed,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.onProceed;
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
