import 'package:dchange/backend/local_storage/local_storage.dart';
import 'package:dchange/backend/utils/custom_snackbar.dart';

import '../../utils/basic_screen_imports.dart';

class DeepLinkController extends GetxController {
  void handleDeepLink(Uri? uri) {
    if (uri != null) {
      final code = extractLastSegment(uri.toString());
      debugPrint('Last Segment: $code'); // Output: Last Segment: trade id [int]
      debugPrint('Open app from deep link'); // Check open app from deep link? or not!
      LocalStorage.saveQrCodeId(id: code);
      LocalStorage.saveDeepLink(deepLink: true);
      CustomSnackBar.success('Open app from deep link');
    }
  }

  String extractLastSegment(String url) {
    final uri = Uri.parse(url);
    final segments = uri.path.split('/');
    if (segments.isNotEmpty) {
      return segments.last;
    } else {
      return ''; // Return an empty string or handle error as needed
    }
  }
}
