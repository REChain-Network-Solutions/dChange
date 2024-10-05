// ignore_for_file: deprecated_member_use

part of 'ad_create_success_screen.dart';

class AdCreateSuccessMobileScreenLayout extends StatelessWidget {
  AdCreateSuccessMobileScreenLayout({super.key, required this.controller});

  final AdCreateSuccessController controller;
  final GlobalKey previewContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() async {
      Get.offAllNamed(Routes.navigationScreen);
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        _logoWidget(context),
        _titleSubTitleWidget(context),
        _qrCodeWidget(context),
        _copyLinkWidget(context),
        _shareButtonWidget(context),
      ],
    );
  }

  _shareButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.share,
      onPressed: () {
        _captureAsScreenShort(context);
      },
    ).marginSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _copyLinkWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.666),
      margin: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.666),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
        ),
      ),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Expanded(
            flex: 10,
            child: TitleHeading3Widget(
              text: controller.url.value,
              opacity: 0.30,
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: CustomImageWidget(path: Assets.icon.copy),
              onTap: () async {
                await Clipboard.setData(
                        ClipboardData(text: controller.url.value))
                    .then((value) {
                  CustomSnackBar.success(Strings.copyQrUrl);
                });
              },
            ),
          )
        ],
      ),
    ).marginSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }

  _titleSubTitleWidget(BuildContext context) {
    return const TitleSubTitleWidget(
      title: Strings.adCreateSuccessfully,
      subTitle: Strings.msgYourPostWillBe,
      isCenterText: true,
    ).paddingSymmetric(
      horizontal: Dimensions.marginSizeHorizontal * 0.7,
    );
  }

  _qrCodeWidget(BuildContext context) {
    return RepaintBoundary(
      key: previewContainer,
      child: Image.network(
        controller.qrCode.value,
        height: Dimensions.heightSize * 15,
      ).paddingSymmetric(
        vertical: Dimensions.marginSizeVertical * 2.083,
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
      ),
    );
  }

  _logoWidget(BuildContext context) {
    return Image.asset(
      Assets.logo.appLauncher.path,
      scale: 4,
    ).paddingSymmetric(
      vertical: Dimensions.marginSizeVertical,
      horizontal: Dimensions.marginSizeHorizontal * 0.8,
    );
  }

  Future<void> _captureAsScreenShort(BuildContext context) {
    List<String> imagePaths = [];
    final RenderBox box = context.findRenderObject() as RenderBox;
    return Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = previewContainer.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage();
      final directory = (await getApplicationDocumentsDirectory()).path;
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile = File('$directory/qrCode.png');
      imagePaths.add(imgFile.path);
      imgFile.writeAsBytes(pngBytes).then((value) async {
        await Share.shareFiles(
          imagePaths,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        );
      }).catchError((onError) {});
    });
  }
}
