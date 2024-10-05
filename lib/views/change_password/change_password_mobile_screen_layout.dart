// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../change_password/change_password_screen.dart';

class ChangePasswordMobileScreenLayout extends StatelessWidget {
  ChangePasswordMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final ChangePasswordController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.changePassword),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ChangePasswordFieldsWidget(
            controller: controller,
          ),
          _changePasswordButtonWidget(context)
        ],
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }

  _changePasswordButtonWidget(BuildContext context) {
    return Obx(
      () => PrimaryButton(
        isLoading: controller.isLoading,
        title: Strings.changePassword,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            controller.onChangePassword;
          }
        },
      ),
    );
  }
}
