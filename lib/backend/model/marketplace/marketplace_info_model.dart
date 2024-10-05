import 'dart:convert';

MarketplaceInfoModel marketplaceInfoModelFromJson(String str) =>
    MarketplaceInfoModel.fromJson(json.decode(str));

String marketplaceInfoModelToJson(MarketplaceInfoModel data) =>
    json.encode(data.toJson());

class MarketplaceInfoModel {
  Message message;
  Data data;

  MarketplaceInfoModel({
    required this.message,
    required this.data,
  });

  factory MarketplaceInfoModel.fromJson(Map<String, dynamic> json) =>
      MarketplaceInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Trads trads;

  Data({
    required this.trads,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trads: Trads.fromJson(json["trads"]),
      );

  Map<String, dynamic> toJson() => {
        "trads": trads.toJson(),
      };
}

class Trads {
  int currentPage;
  List<Datum> data;

  dynamic nextPageUrl;
  String path;

  dynamic prevPageUrl;

  int total;

  Trads({
    required this.currentPage,
    required this.data,
    required this.nextPageUrl,
    required this.path,
    required this.prevPageUrl,
    required this.total,
  });

  factory Trads.fromJson(Map<String, dynamic> json) => Trads(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        prevPageUrl: json["prev_page_url"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "prev_page_url": prevPageUrl,
        "total": total,
      };
}

class Datum {
  String imagePath;
  String defaultImage;
  String baseUr;
  int id;
  String exchangeRate;
  String amount;
  String rate;
  ECurrency saleCurrency;
  ECurrency rateCurrency;
  User user;

  Datum({
    required this.imagePath,
    required this.defaultImage,
    required this.baseUr,
    required this.id,
    required this.exchangeRate,
    required this.amount,
    required this.rate,
    required this.saleCurrency,
    required this.rateCurrency,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        imagePath: json["image_path"],
        defaultImage: json["default_image"],
        baseUr: json["base_ur"],
        id: json["id"],
        exchangeRate: json["exchange_rate"],
        amount: json["amount"],
        rate: json["rate"],
        saleCurrency: ECurrency.fromJson(json["sale_currency"]),
        rateCurrency: ECurrency.fromJson(json["rate_currency"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "image_path": imagePath,
        "default_image": defaultImage,
        "base_ur": baseUr,
        "id": id,
        "exchange_rate": exchangeRate,
        "amount": amount,
        "rate": rate,
        "sale_currency": saleCurrency.toJson(),
        "rate_currency": rateCurrency.toJson(),
        "user": user.toJson(),
      };
}

class ECurrency {
  int id;
  String code;
  String symbol;
  String flag;
  String rate;

  ECurrency({
    required this.id,
    required this.code,
    required this.symbol,
    required this.flag,
    required this.rate,
  });

  factory ECurrency.fromJson(Map<String, dynamic> json) => ECurrency(
        id: json["id"],
        code: json["code"],
        symbol: json["symbol"],
        flag: json["flag"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "symbol": symbol,
        "flag": flag,
        "rate": rate,
      };
}

class User {
  int id;
  dynamic image;
  String name;
  int emailVerified;
  int kycVerified;

  User({
    required this.id,
    this.image,
    required this.name,
    required this.emailVerified,
    required this.kycVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        image: json["image"] ?? '',
        name: json["name"],
        emailVerified: json["email_verified"],
        kycVerified: json["kyc_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "email_verified": emailVerified,
        "kyc_verified": kycVerified,
      };
}

class Link {
  dynamic url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] ?? '',
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
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
