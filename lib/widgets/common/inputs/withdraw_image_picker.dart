import 'dart:io';

import 'package:dchange/controller/money_out/money_out_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../backend/utils/custom_snackbar.dart';
import '../../../utils/dimensions.dart';

File? imageFile;

class WithdrawManualPaymentImageWidget extends StatelessWidget {
  WithdrawManualPaymentImageWidget(
      {super.key, required this.labelName, required this.fieldName});

  final controller = Get.put(MoneyOutController());
  final String labelName;
  final String fieldName;

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
      if (image == null) return;

      imageFile = File(image.path);

      if (controller.listFieldName.isNotEmpty) {
        if (controller.listFieldName.contains(fieldName)) {
          int itemIndex = controller.listFieldName.indexOf(fieldName);
          controller.listFieldName[itemIndex] = fieldName;
          controller.listImagePath[itemIndex] = imageFile!.path;
        } else {
          controller.listImagePath.add(imageFile!.path);
          controller.listFieldName.add(fieldName);
        }
      } else {
        controller.listImagePath.add(imageFile!.path);
        controller.listFieldName.add(fieldName);
      }

      Get.back();
      CustomSnackBar.success('$labelName Added');
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => imagePickerBottomSheetWidget(context),
        );
      },
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.10,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: Dimensions.widthSize * 0.5,
            ),
            Text(
              labelName,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Dimensions.headingTextSize3,
                fontWeight: FontWeight.w200,
              ),
              // overflow: TextOverflow.ellipsis,
              // maxLines: 2,
            )
          ],
        ),
      ),
    );
  }

  imagePickerBottomSheetWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.15,
      margin: EdgeInsets.all(Dimensions.marginSizeVertical * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: IconButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                )),
          ),
        ],
      ),
    );
  }
}
