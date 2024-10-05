part of '../../views/change_password/change_password_screen.dart';

class ChangePasswordFieldsWidget extends StatelessWidget {
  const ChangePasswordFieldsWidget({super.key, required this.controller});
  final ChangePasswordController controller;
  @override
  Widget build(BuildContext context) {
    Color fillColor = Theme.of(context).colorScheme.background;
    return Column(
      children: [
        PrimaryInputWidget(
          controller: controller.oldPasswordController,
          hintText: Strings.enterOldPassword,
          label: Strings.oldPassword,
          prefixIconPath: Assets.icon.lock,
          isPasswordField: true,
          fillColor: fillColor,
          textInputType: TextInputType.text,
        ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
        PrimaryInputWidget(
          controller: controller.newPasswordController,
          hintText: Strings.enterNewPassword,
          label: Strings.newPassword,
          prefixIconPath: Assets.icon.lock,
          isPasswordField: true,
          fillColor: fillColor,
          textInputType: TextInputType.text,
        ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
        PrimaryInputWidget(
          controller: controller.confirmPasswordController,
          hintText: Strings.enterConfirmPassword,
          label: Strings.confirmPassword,
          prefixIconPath: Assets.icon.lock,
          isPasswordField: true,
          fillColor: fillColor,
          textInputType: TextInputType.text,
        ).paddingOnly(bottom: Dimensions.marginSizeVertical * 1.666),
      ],
    );
  }
}
