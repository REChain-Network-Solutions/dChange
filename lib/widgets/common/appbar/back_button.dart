import 'package:dchange/language/language_controller.dart';

import '../../../custom_assets/assets.gen.dart';
import '../../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Obx(() => Transform.rotate(
            angle: Get.find<LanguageController>().selectedLanguage.value == "ar"
                ? 3.1
                : 0,
            child: CustomImageWidget(path: Assets.icon.back).paddingSymmetric(
              horizontal: Dimensions.marginSizeHorizontal * 0.5,
            ),
          )),
    );
  }
}
