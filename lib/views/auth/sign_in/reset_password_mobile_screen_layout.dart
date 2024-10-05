part of '../sign_in/reset_password_screen.dart';

class ResetPasswordMobileScreenLayout extends StatelessWidget {
  ResetPasswordMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final ResetPasswordController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<bool> willPop() {
      Get.offNamedUntil(Routes.signInScreen, (route) => false);
      return Future.value(true);
    }

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: willPop,
      child: Scaffold(
        appBar: const PrimaryAppBar(
          Strings.resetPassword,
          showBackButton: false,
        ),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          _inputFieldWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 1.66,
      ),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.resetPassword,
                onPressed: () {
                  controller.onResetPassword;
                },
              ),
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PrimaryInputWidget(
            controller: controller.newPasswordController,
            hintText: Strings.enterNewPassword,
            label: Strings.newPassword,
            prefixIconPath: Assets.icon.lock,
            fillColor: Theme.of(context).colorScheme.background,
            isPasswordField: true,
            textInputType: TextInputType.text,
          ),
          verticalSpace(Dimensions.heightSize * 1.6),
          PrimaryInputWidget(
            controller: controller.confirmPasswordController,
            hintText: Strings.enterConfirmPassword,
            label: Strings.confirmPassword,
            prefixIconPath: Assets.icon.lock,
            fillColor: Theme.of(context).colorScheme.background,
            isPasswordField: true,
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
