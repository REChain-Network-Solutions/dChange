import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RetryAlertWidget extends StatelessWidget {
  const RetryAlertWidget({super.key, required this.onPressed,});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Success"),
      titleTextStyle:
      const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,fontSize: 20),
      actionsOverflowButtonSpacing: 20,
      actions: [
        ElevatedButton(onPressed: (){
          Get.back();
        }, child: const Text("Back")),
        ElevatedButton(onPressed: onPressed, child: const Text("Next")),
      ],
      content: const Text("Saved successfully"),
    );
  }
}
