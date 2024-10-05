import 'package:dchange/utils/basic_screen_imports.dart';

import 'back_button.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.centerTitle = true,
    this.action,
    this.leading,
    this.bottom,
    this.toolbarHeight,
    this.appbarSize,
  });

  final String title;
  final Color? backgroundColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appbarSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: TitleHeading2Widget(text: title),
      actions: action,
      leading: showBackButton
          ? leading ??
              BackButtonWidget(
                onTap: () {
                  Get.close(1);
                },
              )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      scrolledUnderElevation: 0,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize =>
      Size.fromHeight(appbarSize ?? Dimensions.appBarHeight);
}
