import 'package:dchange/controller/currency/currency_controller.dart';

import '../controller/profile/update_profile_controller.dart';
import '../utils/basic_screen_imports.dart';

class InitialScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateProfileController());
    Get.put(CurrencyController());
  }
}
