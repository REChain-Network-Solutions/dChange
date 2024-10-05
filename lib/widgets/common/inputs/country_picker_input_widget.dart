import 'package:dchange/controller/profile/update_profile_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../../language/language_controller.dart';
import '../../../utils/basic_screen_imports.dart';

class ProfileCountryCodePickerWidget extends StatelessWidget {
  const ProfileCountryCodePickerWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    final updateProfileController = Get.put(UpdateProfileController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Get.find<LanguageController>().getTranslation(
            Strings.country,
          ),
          style: CustomStyle.darkHeading4TextStyle.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomColor.primaryLightTextColor,
          ),
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          width: double.infinity,
          child: CountryCodePicker(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
            textStyle: Get.isDarkMode
                ? CustomStyle.darkHeading3TextStyle
                : CustomStyle.lightHeading3TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor.withOpacity(0.3),
                  ),
            onChanged: (value) {
              controller.text = value.name!;
              updateProfileController.selectCountryCode.value =
                  value.dialCode.toString();
              updateProfileController.selectCountry.value =
                  value.name.toString();
            },
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            initialSelection:
                controller.text.isNotEmpty ? controller.text : "United States",
            backgroundColor: Colors.transparent,
            showCountryOnly: true,
            alignLeft: true,
            searchStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            dialogTextStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            onInit: (code) => {
              updateProfileController.countryController.text =
                  code!.name.toString(),
              updateProfileController.selectCountryCode.value =
                  code.dialCode.toString(),
            },
          ),
        ),
      ],
    );
  }
}
