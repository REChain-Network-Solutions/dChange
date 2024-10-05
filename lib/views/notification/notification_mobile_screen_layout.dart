part of '../notification/notification_screen.dart';

class NotificationMobileScreenLayout extends StatelessWidget {
  NotificationMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final NotificationController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: () async {
        controller.getNotificationApiProcess();
      },
      child: AnimationLimiter(
        child: controller.notificationInfoModel.data.notifications.isEmpty
            ? const Center(
                child: TitleHeading3Widget(text: Strings.noNotificationFound))
            : ListView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: List.generate(
                  controller.notificationInfoModel.data.notifications.length,
                  (index) => CustomListViewAnimation(
                    index: index,
                    child: NotificationWidget(
                      data: controller
                          .notificationInfoModel.data.notifications[index],
                    ),
                  ),
                ),
              ),
      ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8),
    );
  }
}
