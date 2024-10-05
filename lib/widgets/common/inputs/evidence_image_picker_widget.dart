import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../backend/utils/custom_snackbar.dart';
import '../../../controller/marketplace/marketplace_buying_preview_controller.dart';
import '../../../language/english.dart';
import '../../../language/language_controller.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';

File? imageFile;

class EvidenceImagePickerWidget extends StatefulWidget {
  const EvidenceImagePickerWidget({
    super.key,
    required this.labelName,
    required this.fieldName,
  });

  final String labelName;
  final String fieldName;

  @override
  State<EvidenceImagePickerWidget> createState() =>
      _EvidenceImagePickerWidgetState();
}

class _EvidenceImagePickerWidgetState extends State<EvidenceImagePickerWidget> {
  final controller = Get.put(MarketplaceBuyingPreviewController());

  Future pickImage(imageSource) async {
    try {
      final image =
          await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
      if (image == null) return;

      imageFile = File(image.path);

      if (controller.listFieldName.isNotEmpty) {
        if (controller.listFieldName.contains(widget.fieldName)) {
          int itemIndex = controller.listFieldName.indexOf(widget.fieldName);
          controller.listFieldName[itemIndex] = widget.fieldName;
          controller.listImagePath[itemIndex] = imageFile!.path;
        } else {
          controller.listImagePath.add(imageFile!.path);
          controller.listFieldName.add(widget.fieldName);
        }
      } else {
        controller.listImagePath.add(imageFile!.path);
        controller.listFieldName.add(widget.fieldName);
      }
      setState(() {
        controller.updateImageData(widget.fieldName, imageFile!.path);
      });

      Get.back();
      CustomSnackBar.success('${widget.labelName} Added');
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
          backgroundColor: Theme.of(context).colorScheme.background,
          builder: (context) => imagePickerBottomSheetWidget(context),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelName,
            style: CustomStyle.darkHeading4TextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomColor.primaryLightTextColor,
            ),
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          Container(
            height: controller.getImagePath(widget.fieldName) == null
                ? null
                : MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                border: RDottedLineBorder.all(
                  color: Theme.of(context).primaryColor,
                ),
                image: controller.getImagePath(widget.fieldName) == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(
                            controller.getImagePath(widget.fieldName) ?? '',
                          ),
                        ),
                      )),
            child: controller.getImagePath(widget.fieldName) == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: Dimensions.widthSize * 0.5,
                      ),
                      Text(
                        Get.find<LanguageController>()
                            .getTranslation(Strings.uploadImage),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: Dimensions.headingTextSize3,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  )
                : const Row(children: []),
          ),
        ],
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
