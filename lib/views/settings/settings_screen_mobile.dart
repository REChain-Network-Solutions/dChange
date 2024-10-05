import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '/language/language_drop_down.dart';

class SettingScreenMobile extends StatelessWidget {
  const SettingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(Strings.settings),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _changeLanguageWidget(context),
          _twoFaWidget(context),
        ],
      ),
    );
  }

  _changeLanguageWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        const TitleHeading3Widget(text: Strings.changeLanguage),
        ChangeLanguageWidget(),
      ],
    ).paddingOnly(bottom: Dimensions.heightSize);
  }

  _twoFaWidget(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.twoFaVerificationScreen);
        },
        child: const TitleHeading3Widget(text: Strings.twoFaVerification));
  }
}
