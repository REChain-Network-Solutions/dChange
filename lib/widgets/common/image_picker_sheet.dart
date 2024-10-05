import 'package:flutter_animate/flutter_animate.dart';

import '../../utils/basic_screen_imports.dart';
import 'text_labels/title_heading5_widget.dart';

class ImagePickerSheet extends StatelessWidget {
  final VoidCallback fromCamera, fromGallery;
  const ImagePickerSheet({
    super.key,
    required this.fromCamera,
    required this.fromGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainMin,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: mainMin,
          children: [
            InkWell(
              onTap: fromGallery,
              child: Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.image,
                          color: Theme.of(context).primaryColor,
                          size: Dimensions.iconSizeLarge,
                        ),
                      ),
                      TitleHeading5Widget(
                        text: Strings.fromGallery,
                        color: Theme.of(context).primaryColor,
                        fontSize: Dimensions.headingTextSize6,
                      )
                    ],
                  ),
                ),
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 4),
            InkWell(
              onTap: fromCamera,
              child: Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.4),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                          size: Dimensions.iconSizeLarge,
                        ),
                      ),
                      TitleHeading5Widget(
                        text: Strings.fromCamera,
                        color: Theme.of(context).primaryColor,
                        fontSize: Dimensions.headingTextSize6,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: Dimensions.marginSizeVertical * 1.2),
      ],
    );
  }
}
