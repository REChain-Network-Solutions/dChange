// ignore_for_file: must_be_immutable

import 'package:dchange/controller/add_money/add_money_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:dchange/views/congratulation/congratulation_screen.dart';
import 'package:dchange/widgets/common/others/custom_image_widget.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../custom_assets/assets.gen.dart';
import '../../routes/routes.dart';

class StripeWebPaymentScreen extends StatelessWidget {
  StripeWebPaymentScreen({super.key});

  final controller = Get.put(AddMoneyController());

  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.navigationScreen);
        return false;
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          controller.selectWallet.value,
          showBackButton: false,
          action: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                Routes.navigationScreen.offAllNamed;
              },
              child: CustomImageWidget(
                path: Assets.icon.homeIcon,
                color: Get.isDarkMode
                    ? CustomColor.whiteColor
                    : CustomColor.blackColor,
              ).paddingOnly(right: Dimensions.paddingSize),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Obx(
          () => controller.isConfirmLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final paymentUrl = controller.addMoneyInsertStripeModel.data.url;

    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {
                // Handle JavaScript messages from WebView
              },
            );
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
          },
          onLoadStop: (controller, url) {
            isLoading.value = false;
            if (url.toString().contains('stripe/payment/success') ||
                url.toString().contains('sslcommerz/success') ||
                url.toString().contains('success/response') ||
                url.toString().contains('qrpay/callback')) {
              Get.to(
                () => const CongratulationScreen(
                  title: Strings.congratulation,
                  subTitle: Strings.yourMoneyHasBeen,
                  route: Routes.navigationScreen,
                ),
              );
            }
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, isLoading, _) {
            return isLoading
                ? const Center(child: CustomLoadingAPI())
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
