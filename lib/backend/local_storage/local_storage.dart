import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/constants.dart';

const String idKey = "idKey";
const String tradeIdKey = "tradeIdKey";
const String marketplaceItemsKey = "marketplaceItemsKey";
const String forexcrowIdKey = "forexcrowIdKey";
const String twoFactorPhone = "two_factor_phone";
const String twoFaKey = "twoFaKey";
const String bankAccountKey = "bankAccountKey";
const String kycKey = "kycKey";
const String numKey = "numKey";

const String nameKey = "nameKey";

const String deepLinkKey = "deepLinkKey";

const String qrCodeIdKey = "qrCodeIdKey";

const String tokenKey = "tokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String showAdKey = "showAdKey";

const String isLoggedInKey = "isLoggedInKey";
const String isUserVerifiedKey = "isUserVerifiedKey";
const String isSmsVerifyKey = "isSmsVerifyKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String language = "language";

const String smallLanguage = "smallLanguage";

const String capitalLanguage = "capitalLanguage";
const String forxcrowIdentifier = "forxcrowIdentifier";

class LocalStorage {
  static Future<void> saveForxcrowIdentifier(
      {required String identifier}) async {
    final box = GetStorage();
    await box.write(forxcrowIdentifier, identifier);
  }

  static Future<void> saveId({required int id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveTwoFactorPhone({required String number}) async {
    final box = GetStorage();

    await box.write(twoFactorPhone, number);
    debugPrint(number);
  }

  static Future<void> saveTradeID({required String id}) async {
    final box = GetStorage();
    await box.write(tradeIdKey, id);
    debugPrint('-------- Trade Id: $id --------------');
  }

  static Future<void> saveBuyAndOfferId({required String id}) async {
    final box = GetStorage();
    await box.write(marketplaceItemsKey, id);
    debugPrint('-------- Marketplace id: $id --------------');
  }

  static Future<void> saveTwoFaID({required bool id}) async {
    final box = GetStorage();
    await box.write(twoFaKey, id);
  }

  static Future<void> saveIsBankAccount({required bool id}) async {
    final box = GetStorage();
    await box.write(bankAccountKey, id);

    debugPrint('is bank account:$id');
  }

  static Future<void> saveKyc({required bool id}) async {
    final box = GetStorage();
    await box.write(kycKey, id);

    debugPrint('is Kyc Verified:$id');
  }

  static Future<void> saveForexcrowID({required String id}) async {
    final box = GetStorage();
    await box.write(forexcrowIdKey, id);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();

    await box.write(nameKey, name);
    debugPrint(name);
  }

  static Future<void> saveNumber({required String num}) async {
    final box = GetStorage();

    await box.write(numKey, num);
  }

  static Future<void> saveQrCodeId({required String id}) async {
    final box = GetStorage();
    await box.write(qrCodeIdKey, id);
  }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();
    debugPrint(email);
    await box.write(emailKey, email);
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> saveDeepLink({required bool deepLink}) async {
    final box = GetStorage();

    await box.write(deepLinkKey, deepLink);
  }

  static Future<void> saveUserVerified({required bool value}) async {
    final box = GetStorage();

    await box.write(isUserVerifiedKey, value);
  }

  static Future<void> saveIsSmsVerify({required bool value}) async {
    final box = GetStorage();

    await box.write(isSmsVerifyKey, value);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

  static Future<void> scheduleEmpty({required bool isScheduleEmpty}) async {
    final box = GetStorage();

    await box.write(isScheduleEmptyKey, isScheduleEmpty);
  }

  static Future<void> showAdYes({required bool isShowAdYes}) async {
    final box = GetStorage();

    await box.write(showAdKey, isShowAdYes);
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();

    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
    required String languageName,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();
    final box3 = GetStorage();
    languageStateName = languageName;
    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
    await box3.write(language, languageName);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'en';
    String capital = GetStorage().read(capitalLanguage) ?? 'EN';
    String languages = GetStorage().read(language) ?? 'English';
    return [small, capital, languages];
  }

  static Future<void> changeLanguage() async {
    final box = GetStorage();
    await box.remove(language);
  }

  static int getId() {
    return GetStorage().read(idKey);
  }

  static String getForxcrowIdentifier() {
    return GetStorage().read(forxcrowIdentifier) ?? 'Null';
  }

  static String getTradeID() {
    return GetStorage().read(tradeIdKey) ?? 'Null';
  }

  static String getBuyAndOfferId() {
    return GetStorage().read(marketplaceItemsKey) ?? 'Null';
  }

  static String getForexcrowID() {
    return GetStorage().read(forexcrowIdKey) ?? 'Null';
  }

  static String getQrCodeId() {
    return GetStorage().read(qrCodeIdKey) ?? 'Null';
  }

  static bool getTwoFaID() {
    return GetStorage().read(twoFaKey) ?? false;
  }

  static bool getDeepLink() {
    return GetStorage().read(deepLinkKey) ?? false;
  }

  static bool isBankAccount() {
    return GetStorage().read(bankAccountKey) ?? false;
  }

  static bool isUserVerified() {
    return GetStorage().read(isUserVerifiedKey) ?? false;
  }

  static bool isKycVerified() {
    return GetStorage().read(kycKey) ?? false;
  }

  static String getName() {
    return GetStorage().read(nameKey) ?? '';
  }

  static String getTwoFactorPhone() {
    return GetStorage().read(twoFactorPhone) ?? '';
  }

  static String getEmail() {
    return GetStorage().read(emailKey) ?? 'NULL';
  }

  static String getNumber() {
    return GetStorage().read(numKey) ?? 'no number added';
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String? getImage() {
    return GetStorage().read(imageKey);
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isSmsVerify() {
    return GetStorage().read(isSmsVerifyKey) ?? false;
  }

  static bool isDataLoaded() {
    return GetStorage().read(isDataLoadedKey) ?? false;
  }

  static bool isScheduleEmpty() {
    return GetStorage().read(isScheduleEmptyKey) ?? false;
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static bool showAdPermission() {
    return GetStorage().read(showAdKey) ?? true;
  }

  static Future<void> signOut() async {
    final box = GetStorage();

    await box.remove(idKey);

    await box.remove(nameKey);

    await box.remove(emailKey);

    await box.remove(imageKey);

    await box.remove(isLoggedInKey);

    await box.remove(isOnBoardDoneKey);

    await box.remove(tokenKey);
  }

  static Future<void> removeDeepLinkValue() async {
    final box = GetStorage();
    await box.remove(deepLinkKey);
    await box.remove(qrCodeIdKey);
  }
}
