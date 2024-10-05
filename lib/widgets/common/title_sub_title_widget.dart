import '../../utils/basic_screen_imports.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleFontSize,
    this.titleColor,
    this.subTitleColor,
    this.isCenterText = false,
  });
  final String title, subTitle;
  final double? subTitleFontSize;
  final Color? titleColor, subTitleColor;
  final bool isCenterText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isCenterText ? crossCenter : crossStart,
      mainAxisAlignment: isCenterText ? mainCenter : mainCenter,
      children: [
        TitleHeading2Widget(
          text: title,
          color: titleColor ?? CustomColor.primaryLightTextColor,
          fontWeight: FontWeight.w600,
          textAlign: isCenterText ? TextAlign.center : TextAlign.start,
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Visibility(
          visible: subTitle != '',
          child: TitleHeading4Widget(
            text: subTitle,
            color: subTitleColor ??
                CustomColor.primaryLightTextColor.withOpacity(0.60),
            fontWeight: FontWeight.w500,
            fontSize: subTitleFontSize ?? Dimensions.headingTextSize4,
            textAlign: isCenterText ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
