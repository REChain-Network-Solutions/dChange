part of "my_wallet_screen.dart";

class MyWalletMobileScreenLayout extends StatelessWidget {
  final MyWalletController controller;

  final formKey = GlobalKey<FormState>();
  MyWalletMobileScreenLayout({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.myWallet),
      body: Obx(
        () => controller.controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        MyWalletCurrencyWidget(controller: controller),
      ],
    );
  }
}
