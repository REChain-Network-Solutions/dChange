import 'dart:io';
import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import '../../../controller/identity_verification/identity_verification_controller.dart';
import '../image_picker_sheet.dart';

File? imageFile;

class UpdateKycImageWidget extends StatefulWidget {
  const UpdateKycImageWidget(
      {super.key, required this.labelName, required this.fieldName});

  final String labelName;
  final String fieldName;

  @override
  State<UpdateKycImageWidget> createState() => _DropFileState();
}

class _DropFileState extends State<UpdateKycImageWidget> {
  final controller = Get.put(IdentityVerificationController());

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
      // CustomSnackBar.success('$labelName Added');
    } on PlatformException catch (_) {
      // CustomSnackBar.error('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _showImagePickerBottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: RDottedLineBorder.all(
            color: CustomColor.blackColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Container(
          height: Dimensions.heightSize * 7,
          alignment: Alignment.center,
          margin: EdgeInsets.all(
            Dimensions.marginSizeHorizontal * 0.25,
          ),
          decoration: controller.getImagePath(widget.fieldName) == null
              ? BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                      File(
                        controller.getImagePath(widget.fieldName) ?? '',
                      ),
                    ),
                  ),
                ),
          child: Opacity(
            opacity: 0.3,
            child: Column(
              mainAxisAlignment: mainCenter,
              children: const [
                Icon(
                  Icons.cloud_upload_outlined,
                ),
                TitleHeading4Widget(
                  text: Strings.uploadDocument,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showImagePickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: double.infinity,
          child: ImagePickerSheet(
            fromCamera: () {
              pickImage(ImageSource.camera);
            },
            fromGallery: () {
              pickImage(ImageSource.gallery);
            },
          ),
        );
      },
    );
  }
}
