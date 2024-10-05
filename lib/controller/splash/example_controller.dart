import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  // all text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
