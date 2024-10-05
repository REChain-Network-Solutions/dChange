import 'package:dchange/backend/utils/custom_loading_api.dart';

import '../../controller/basic_settings/basic_settings_controller.dart';
import '../../controller/onboard/onbaord_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/common/title_sub_title_widget.dart';

class OnboardMobileScreenLayout extends StatelessWidget {
  OnboardMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final OnboardController controller;
  final basicSettings = Get.put(BasicSettingsController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => basicSettings.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(basicSettings.onboardImage.value),
          fit: BoxFit.cover,
        ),
      ),
      child: _titleAndButtonWidget(context),
    );
  }

  _titleAndButtonWidget(context) {
    return Column(
      mainAxisAlignment: mainEnd,
      children: [
        TitleSubTitleWidget(
          subTitle: basicSettings.onBoardSubTitle.value,
          title: basicSettings.onBoardTitle.value,
          isCenterText: true,
        ),
        verticalSpace(Dimensions.heightSize * 2.5),
        _buttonWidget(context)
      ],
    );
  }

  _buttonWidget(context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.1,
        left: Dimensions.paddingSize * 1.5,
        right: Dimensions.paddingSize * 1.5,
      ),
      child: PrimaryButton(
        title: Strings.getStarted,
        radius: Dimensions.radius * 5,
        onPressed: () {
          controller.onGetStarted;
        },
      ),
    );
  }
}
