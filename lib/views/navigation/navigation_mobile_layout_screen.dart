// ignore_for_file: unused_element, deprecated_member_use

part of '../navigation/navigation_screen.dart';

class NavigationMobileScreenLayout extends StatelessWidget {
  NavigationMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final NavigationController controller;
  final marketplaceController = Get.put(MarketplaceController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        key: _key,
        drawer: DrawerScreen(),
        appBar: _appBarWidget(context),
        bottomNavigationBar: buildBottomNavigationMenu(context),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => controller.page[controller.selectedIndex.value]);
  }

  buildBottomNavigationMenu(context) {
    return Container(
      height: Dimensions.heightSize * 5.2,
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 2),
            topRight: Radius.circular(Dimensions.radius * 2),
          ),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x19000000), // fixed color
            blurRadius: Dimensions.radius,
            offset: const Offset(0, -4),
            spreadRadius: 0,
          )
        ],
      ),
      child: BottomAppBar(
        elevation: 0,
        notchMargin: 7,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              bottomItemWidget(context, Assets.icon.homeIcon, Strings.home, 0),
              bottomItemWidget(
                  context, Assets.icon.marketplace, Strings.marketplace, 1),
              bottomItemWidget(context, Assets.icon.fresh, Strings.myTrade, 2),
              bottomItemWidget(
                  context, Assets.icon.notification, Strings.notification, 3),
            ],
          ),
        ),
      ),
    );
  }

  bottomItemWidget(context, var icon, label, page) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          controller.selectedIndex.value = page;
        },
        child: controller.selectedIndex.value == page
            ? Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3,
                width: Dimensions.widthSize * 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: _buildRow(context, icon, label, page),
              )
            : Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3,
                width: Dimensions.heightSize * 3.5,
                child: _buildRow(context, icon, label, page),
              ),
      ),
    );
  }

  _buildRow(context, var icon, label, page) {
    final languageController = Get.put(LanguageController());
    return Row(
      mainAxisAlignment: mainCenter,
      crossAxisAlignment: crossCenter,
      children: [
        SvgPicture.asset(
          icon,
          color: controller.selectedIndex.value == page
              ? CustomColor.primaryLightTextColor.withOpacity(0.5)
              : CustomColor.primaryLightTextColor.withOpacity(0.4),
          height: Dimensions.heightSize * 1.2,
          width: Dimensions.widthSize * 2.4,
        ),
        horizontalSpace(Dimensions.widthSize * 0.5),
        Visibility(
          visible: controller.selectedIndex.value == page,
          child: Text(
            languageController.getTranslation(label),
            style: TextStyle(
              fontSize: Dimensions.headingTextSize6,
              color: controller.selectedIndex.value == page
                  ? CustomColor.primaryLightTextColor.withOpacity(0.7)
                  : CustomColor.primaryLightTextColor.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }

  _appBarWidget(context) {
    return controller.selectedIndex.value == 0
        ? _homeAppBarWidget()
        : _marketplaceAppBarWidget(context);
  }

  _homeAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          _key.currentState!.openDrawer(); // <-- Opens drawer
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.55,
          ),
          child: CustomImageWidget(path: Assets.icon.drawer),
        ),
      ),
      title: const AppBasicLogo(scale: 25),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            controller.onProfile;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.5),
            child: CustomImageWidget(
              path: Assets.icon.profileCircle,
              height: Dimensions.heightSize * 2,
            ),
          ),
        ),
      ],
    );
  }

  _marketplaceAppBarWidget(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: TitleHeading2Widget(
          text: _titleWidget(controller.selectedIndex.value)),
      centerTitle: true,
      actions: [
        _filterProcessWidget(context),
      ],
    );
  }

  _titleWidget(index) {
    switch (index) {
      case 1:
        return Strings.marketplace;
      case 2:
        return Strings.myTrade;
      case 3:
        return Strings.notification;
    }
  }

  _filterProcessWidget(BuildContext context) {
    return Visibility(
      visible: controller.selectedIndex.value == 1,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          _showFilterDialog(context);
        },
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSize * 0.3,
            horizontal: Dimensions.paddingSize * 0.25,
          ),
          decoration: ShapeDecoration(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            ),
          ),
          child: CustomImageWidget(
            path: Assets.icon.menu,
            height: Dimensions.heightSize * 0.6,
          ),
        ),
      ),
    );
  }

  _showFilterDialog(BuildContext context) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 2.5,
            vertical: Dimensions.marginSizeVertical * 0.6,
          ),
          alignment: Alignment.topRight,
          surfaceTintColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: Column(
              mainAxisSize: mainMin,
              crossAxisAlignment: crossStart,
              children: [
                Row(
                  mainAxisAlignment: mainSpaceBet,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.back();
                            Get.close(1);
                          },
                          child: CustomImageWidget(path: Assets.icon.back),
                        ),
                        horizontalSpace(Dimensions.widthSize),
                        const TitleHeading4Widget(
                          text: Strings.filters,
                          fontWeight: FontWeight.w500,
                          opacity: 0.30,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        marketplaceController.onResetFilterValue();
                      },
                      child: TitleHeading4Widget(
                        text: Strings.reset,
                        fontSize: Dimensions.headingTextSize6,
                        opacity: 0.30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Get.isDarkMode
                      ? CustomColor.whiteColor.withOpacity(0.10)
                      : CustomColor.blackColor.withOpacity(0.10),
                ),
                CurrencyDropDown(isDialogField: true),
                verticalSpace(Dimensions.heightSize * 0.5),
                const TitleHeading4Widget(
                  text: Strings.selectAmount,
                  fontWeight: FontWeight.w500,
                  opacity: 0.30,
                ),
                Obx(
                  () => SizedBox(
                    height: Dimensions.heightSize * 1.7,
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: Dimensions.radius * 0.8),
                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                        value: marketplaceController.amount.value,
                        onChanged: (newValue) {
                          marketplaceController.amount.value = newValue;
                        },
                        min: 0,
                        max: 100,
                        thumbColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => TitleHeading4Widget(
                    text: marketplaceController.amount.value.toStringAsFixed(2),
                    fontSize: Dimensions.headingTextSize6,
                    opacity: 0.30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(Dimensions.heightSize),
                const TitleHeading4Widget(
                  text: Strings.selectRate,
                  fontWeight: FontWeight.w500,
                  opacity: 0.30,
                ),
                Obx(
                  () => SizedBox(
                    height: Dimensions.heightSize * 1.7,
                    width: double.infinity,
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: Dimensions.radius * 0.8),
                        trackShape: CustomTrackShape(),
                      ),
                      child: Slider(
                        value: marketplaceController.rate.value,
                        onChanged: (newValue) {
                          marketplaceController.rate.value = newValue;
                        },
                        min: 0,
                        max: 100,
                        thumbColor: Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => TitleHeading4Widget(
                    text: marketplaceController.rate.value.toStringAsFixed(2),
                    fontSize: Dimensions.headingTextSize6,
                    opacity: 0.30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpace(Dimensions.heightSize * 1.4),
                PrimaryButton(
                  height: Dimensions.buttonHeight * 0.6,
                  title: Strings.search,
                  onPressed: () {
                    Get.close(1);
                    marketplaceController.isFilter.value = true;
                    marketplaceController.marketplaceInfoGetProcessApi();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx + 5;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
