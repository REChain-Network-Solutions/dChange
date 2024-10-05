part of 'identity_verification_screen.dart';

class IdentityVerificationMobileScreenLayout extends StatelessWidget {
  IdentityVerificationMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final IdentityVerificationController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.identityVerification),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = controller.kycInfoModel.data.kycStatus;
    return data == 2
        ? const StatusDataWidget(
            text: Strings.pending,
            icon: Icons.hourglass_empty,
          )
        : data == 1
            ? const StatusDataWidget(
                text: Strings.verified,
                icon: Icons.check_circle_outline,
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize * 0.8,
                  vertical: Dimensions.paddingSize * 0.6,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    verticalSpace(
                      Dimensions.heightSize * 0.5,
                    ),
                    Visibility(
                      visible: controller.inputFileFields.isNotEmpty,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.21,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // Number of columns in the grid
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),
                            itemCount: controller.inputFileFields.length,
                            // Number of items in the grid
                            itemBuilder: (BuildContext context, int index) {
                              return controller.inputFileFields[index];
                            }),
                      ),
                    ),
                    Obx(() {
                      return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            ...controller.inputFields.map((element) {
                              return element;
                            }),
                          ],
                        ),
                      );
                    }),
                    _buttonWidget(context),
                  ],
                ),
              );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 2,
      ),
      child: Obx(
        () => controller.isSubmitLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.submit,
                onPressed: (() {
                  if (formKey.currentState!.validate()) {
                    controller.kycSubmitApiProcess();
                  }
                }),
              ),
      ),
    );
  }
}
