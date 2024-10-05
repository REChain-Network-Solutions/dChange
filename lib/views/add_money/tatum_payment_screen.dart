// ignore_for_file: unnecessary_to_list_in_spreads

import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../backend/utils/custom_loading_api.dart';
import '../../../../backend/utils/custom_snackbar.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../controller/add_money/add_money_controller.dart';

class TatumPaymentScreen extends StatelessWidget {
  TatumPaymentScreen({super.key});
  final controller = Get.put(AddMoneyController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.cryptoPaymentAddress,
      ),
      backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 0.7,
            vertical: Dimensions.marginSizeVertical * 0.7,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _amountWidget(context),
                _qrCodeWidget(),
                ...controller.inputFields.map((element) {
                  return element;
                }).toList(),
                _copyAddressWidget(context),
              ],
            ),
          ),
        ),
        _buttonWidget(context),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.isTatumConfirmLoading
          ? const CustomLoadingAPI()
          : Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * 0.8,
              ),
              child: PrimaryButton(
                title: Strings.proceed,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.tatumConfirmProcess(context);
                  }
                },
              ),
            ),
    );
  }

  _copyAddressWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        const TitleHeading4Widget(
          text: Strings.payWithThisAddress,
          maxLines: 1,
          fontWeight: FontWeight.w500,
          color: CustomColor.primaryLightTextColor,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Get.isDarkMode
                  ? CustomColor.whiteColor
                  : CustomColor.primaryDarkColor.withOpacity(0.4),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          child: Row(
            children: [
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: TitleHeading4Widget(
                  text: controller.qrAddress.value,
                  maxLines: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  Clipboard.setData(
                          ClipboardData(text: controller.qrAddress.value))
                      .then((_) {
                    CustomSnackBar.success(Strings.addressCopyTo);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius * 0.5),
                      bottomRight: Radius.circular(Dimensions.radius * 0.5),
                    ),
                    color: CustomColor.primaryLightColor,
                  ),
                  child: const Icon(
                    Icons.copy,
                    color: CustomColor.whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
        verticalSpace(Dimensions.heightSize),
      ],
    );
  }

  _qrCodeWidget() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.8,
        horizontal: Dimensions.marginSizeHorizontal * 1.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: CustomColor.whiteColor,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
      child: QrImageView(
        data: controller.qrAddress.value,
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }

  _amountWidget(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius),
        color: Get.isDarkMode
            ? CustomColor.primaryBGDarkColor
            : CustomColor.primaryBGLightColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical,
        horizontal: Dimensions.marginSizeHorizontal,
      ),
      margin: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        children: [
          TitleHeading1Widget(
            textAlign: TextAlign.center,
            text: controller.payableAmount,
            color: CustomColor.primaryDarkColor,
          ),
          verticalSpace(Dimensions.heightSize * 0.2),
          const TitleHeading4Widget(
            text: Strings.payableAmount,
          ),
        ],
      ),
    );
  }
}
