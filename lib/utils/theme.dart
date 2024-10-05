import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';

class Themes {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static final light = ThemeData.light().copyWith(
    // ignore: deprecated_member_use
    useMaterial3: true,
    primaryColor: CustomColor.primaryLightColor,
    colorScheme: const ColorScheme.dark(
      background: CustomColor.primaryBGLightColor,
    ),
    scaffoldBackgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
    brightness: Brightness.light,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
  );
  static final dark = ThemeData.dark().copyWith(
    // ignore: deprecated_member_use
    useMaterial3: true,
    primaryColor: CustomColor.primaryDarkColor,
    colorScheme: const ColorScheme.dark(
      background: CustomColor.primaryBGDarkColor,
    ),
    scaffoldBackgroundColor: CustomColor.primaryDarkScaffoldBackgroundColor,
    brightness: Brightness.dark,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
  );
}
