import 'package:dchange/controller/profile/update_profile_controller.dart';
import 'package:dchange/extensions/custom_extensions.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../views/profile/profile_screen.dart';

class ProfileController extends GetxController {
  final controller = Get.put(UpdateProfileController());

  get onUpdateProfile => Routes.updateProfileScreen.toNamed;
  get onMyWallet => Routes.myWalletScreen.toNamed;
  get onMySpace => Routes.mySectionHistoryScreen.toNamed;
  get onGetOffer => Routes.getOfferScreen.toNamed;
  get onFeeCalculator => Routes.feeCalculatorScreen.toNamed;

  List<Enum> topicList = [
    TopicType.updateProfile,
    TopicType.myWallet,
    TopicType.mySpace,
    TopicType.getOffer,
    TopicType.feeCalculator
  ];
}
