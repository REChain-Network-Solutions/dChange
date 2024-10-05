import 'dart:convert';

BasicSettingsInfoModel basicSettingsInfoModelFromJson(String str) =>
    BasicSettingsInfoModel.fromJson(json.decode(str));

String basicSettingsInfoModelToJson(BasicSettingsInfoModel data) =>
    json.encode(data.toJson());

class BasicSettingsInfoModel {
  Message message;
  Data data;

  BasicSettingsInfoModel({
    required this.message,
    required this.data,
  });

  factory BasicSettingsInfoModel.fromJson(Map<String, dynamic> json) =>
      BasicSettingsInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String defaultLogo;
  String logoImagePath;
  String imagePath;
  List<OnboardScreen> onboardScreen;
  SplashScreen splashScreen;
  WebLinks webLinks;
  AllLogo allLogo;

  Data({
    required this.defaultLogo,
    required this.logoImagePath,
    required this.imagePath,
    required this.onboardScreen,
    required this.splashScreen,
    required this.webLinks,
    required this.allLogo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        defaultLogo: json["default_logo"],
        logoImagePath: json["logo_image_path"],
        imagePath: json["image_path"],
        onboardScreen: List<OnboardScreen>.from(
            json["onboard_screen"].map((x) => OnboardScreen.fromJson(x))),
        splashScreen: SplashScreen.fromJson(json["splash_screen"]),
        webLinks: WebLinks.fromJson(json["web_links"]),
        allLogo: AllLogo.fromJson(json["all_logo"]),
      );

  Map<String, dynamic> toJson() => {
        "default_logo": defaultLogo,
        "logo_image_path": logoImagePath,
        "image_path": imagePath,
        "onboard_screen":
            List<dynamic>.from(onboardScreen.map((x) => x.toJson())),
        "splash_screen": splashScreen.toJson(),
        "web_links": webLinks.toJson(),
        "all_logo": allLogo.toJson(),
      };
}

class AllLogo {
  String siteLogoDark;
  String siteLogo;
  String siteFavDark;
  String siteFav;

  AllLogo({
    required this.siteLogoDark,
    required this.siteLogo,
    required this.siteFavDark,
    required this.siteFav,
  });

  factory AllLogo.fromJson(Map<String, dynamic> json) => AllLogo(
        siteLogoDark: json["site_logo_dark"],
        siteLogo: json["site_logo"],
        siteFavDark: json["site_fav_dark"],
        siteFav: json["site_fav"],
      );

  Map<String, dynamic> toJson() => {
        "site_logo_dark": siteLogoDark,
        "site_logo": siteLogo,
        "site_fav_dark": siteFavDark,
        "site_fav": siteFav,
      };
}

class WebLinks {
  String privacyPolicy;
  String aboutUs;
  String contactUs;

  WebLinks({
    required this.privacyPolicy,
    required this.aboutUs,
    required this.contactUs,
  });

  factory WebLinks.fromJson(Map<String, dynamic> json) => WebLinks(
        privacyPolicy: json["privacy-policy"],
        aboutUs: json["about-us"],
        contactUs: json["contact-us"],
      );

  Map<String, dynamic> toJson() => {
        "privacy-policy": privacyPolicy,
        "about-us": aboutUs,
        "contact-us": contactUs,
      };
}

class OnboardScreen {
  int id;
  String image;
  String title;
  String subTitle;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  OnboardScreen({
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OnboardScreen.fromJson(Map<String, dynamic> json) => OnboardScreen(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        subTitle: json["sub_title"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "sub_title": subTitle,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SplashScreen {
  int id;
  String splashScreenImage;
  String version;
  DateTime createdAt;
  DateTime updatedAt;

  SplashScreen({
    required this.id,
    required this.splashScreenImage,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
        id: json["id"],
        splashScreenImage: json["splash_screen_image"],
        version: json["version"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "splash_screen_image": splashScreenImage,
        "version": version,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
