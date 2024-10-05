part of '../../views/notification/notification_screen.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.data});
  final Notifications data;
  @override
  Widget build(BuildContext context) {
    var day = DateFormat('dd');
    var month = DateFormat('MMM');
    return Container(
      margin: EdgeInsets.only(
        bottom: Dimensions.marginBetweenInputTitleAndBox * 0.5,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.65),
      decoration: ShapeDecoration(
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Column(
              children: [
                TitleHeading1Widget(
                  text: day.format(data.createdAt),
                  fontWeight: FontWeight.w700,
                ),
                TitleHeading4Widget(
                  text: month.format(data.createdAt),
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              height: Dimensions.heightSize * 3,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.45,
              ),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.5,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: CustomColor.blackColor.withOpacity(0.20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading3Widget(text: data.message.title),
                verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
                TitleHeading5Widget(
                  text: data.message.message,
                  opacity: 0.30,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
