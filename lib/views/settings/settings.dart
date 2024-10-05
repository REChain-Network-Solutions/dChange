import '../../utils/basic_screen_imports.dart';
import '/utils/responsive_layout.dart';
import '/views/settings/settings_screen_mobile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileScaffold: SettingScreenMobile());
  }
}
