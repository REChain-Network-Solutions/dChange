import '../utils/basic_screen_imports.dart';
import 'language_controller.dart';

class ChangeLanguageWidget extends StatelessWidget {
  ChangeLanguageWidget({super.key, this.isHome = false});
  final bool isHome;
  final _languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !isHome
          ? _dropDown(context)
          : Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.5,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              child: _dropDown(context),
            ),
    );
  }

  _dropDown(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      value: _languageController.selectedLanguage.value,
      underline: isHome ? Container() : null,
      style: Get.isDarkMode
          ? CustomStyle.darkHeading4TextStyle
          : CustomStyle.lightHeading4TextStyle,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        color: isHome ? CustomColor.primaryLightTextColor : null,
      ).paddingOnly(top: Dimensions.heightSize * 0.2),
      onChanged: (String? newValue) {
        if (newValue != null) {
          _languageController.changeLanguage(newValue);
        }
      },
      items: _languageController.languages.map<DropdownMenuItem<String>>(
        (language) {
          return DropdownMenuItem<String>(
            value: language.code,
            child: Text(
              isHome ? language.code.toUpperCase() : language.name,
            ),
          );
        },
      ).toList(),
    );
  }
}
