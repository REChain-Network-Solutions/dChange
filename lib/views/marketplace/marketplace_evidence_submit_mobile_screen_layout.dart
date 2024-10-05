part of 'marketplace_evidence_submit_screen.dart';

class MarketplaceEvidenceMobileScreenLayout extends StatelessWidget {
  MarketplaceEvidenceMobileScreenLayout({super.key, required this.controller});

  final MarketplaceBuyingPreviewController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.evidenceNote),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.7,
        vertical: Dimensions.paddingSize * 0.7,
      ),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ...controller.inputFields.map((element) {
              return element;
            }),
            _buttonWidget(context)
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => PrimaryButton(
          isLoading: controller.isSubmitLoading,
          title: Strings.submit,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.onSubmit;
            }
          },
        ),
      ),
    );
  }
}
