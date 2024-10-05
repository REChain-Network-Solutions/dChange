import 'package:dchange/utils/basic_screen_imports.dart';

class SeparateDoubleTextWidget extends StatelessWidget {
  final String firstText, secondText;
  const SeparateDoubleTextWidget({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Expanded(
          child: TitleHeading4Widget(
            text: firstText,
            opacity: 0.60,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 0,
          child: TitleHeading3Widget(
            text: secondText,
            opacity: 0.60,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }
}
