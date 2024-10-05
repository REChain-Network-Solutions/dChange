import 'package:dchange/controller/add_money/add_money_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../backend/utils/custom_loading_api.dart';
import '../../../routes/routes.dart';
import '../../custom_assets/assets.gen.dart';
import '../../language/english.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/common/appbar/primary_appbar.dart';
import '../../widgets/common/others/custom_image_widget.dart';

class FlutterWaveWebPaymentScreen extends StatelessWidget {
  FlutterWaveWebPaymentScreen({super.key});

  final controller = Get.put(AddMoneyController());

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
          Strings.flutterWavePayment,
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
    final data = controller.addMoneyInsertFlutterWaveModel.data;
    var paymentUrl = data.url;

    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
      onWebViewCreated: (InAppWebViewController controller) {},
      onProgressChanged: (InAppWebViewController controller, int progress) {},
    );
  }
}
