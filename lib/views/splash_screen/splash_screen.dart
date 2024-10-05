import 'package:dchange/backend/utils/custom_loading_api.dart';
import 'package:dchange/utils/basic_screen_imports.dart';
import 'package:dchange/utils/responsive_layout.dart';

import '../../controller/basic_settings/basic_settings_controller.dart';
import '../../language/language_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(BasicSettingsController());
  final languageController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          controller.splashImage.value,
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
        ),
        Visibility(
          visible: languageController.isLoading && controller.isVisible.value,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              left: MediaQuery.sizeOf(context).width * 0.15,
              right: MediaQuery.sizeOf(context).width * 0.15,
            ),
            child: LinearProgressIndicator(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
