import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternetConnectionWidget extends StatelessWidget {
  final AsyncSnapshot<ConnectivityResult> snapshot;
  final Widget widget;

  const CheckInternetConnectionWidget(
      {super.key, required this.snapshot, required this.widget});

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        final state = snapshot.data!;
        switch (state) {
          case ConnectivityResult.none:
            return const Center(child: Text('Not connected'));
          default:
            return widget;
        }
      default:
        return const Text('');
    }
  }
}
