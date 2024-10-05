import 'package:dchange/utils/basic_screen_imports.dart';

class AmountWidget extends StatelessWidget {
  final String amount, currency;
  final bool isPrimaryColor;
  final double? fontSize;
  const AmountWidget({
    super.key,
    required this.amount,
    required this.currency,
    this.isPrimaryColor = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: amount,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading1TextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize ?? Dimensions.headingTextSize1 * 0.78,
                  )
                : CustomStyle.lightHeading1TextStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize ?? Dimensions.headingTextSize1 * 0.78,
                  ),
          ),
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.widthSize * 0.5),
            ),
          ),
          TextSpan(
            text: currency,
            style: CustomStyle.lightHeading1TextStyle.copyWith(
              color: isPrimaryColor
                  ? Theme.of(context).primaryColor
                  : Get.isDarkMode
                      ? CustomColor.primaryDarkTextColor
                      : CustomColor.primaryLightTextColor,
              fontWeight: FontWeight.w700,
              fontSize: fontSize ?? Dimensions.headingTextSize1 * 0.78,
            ),
          ),
        ],
      ),
    );
  }
}
