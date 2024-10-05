// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../../widgets/common/custom_drop_down/custom_drop_down.dart';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  Message message;
  Data data;

  CurrencyModel({
    required this.message,
    required this.data,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String baseUrl;
  String defaultImage;
  String imagePath;
  List<ECurrency> rateCurrency;
  List<ECurrency> saleCurrency;
  Wallet wallet;
  TradeInfo tradeInfo;

  Data({
    required this.baseUrl,
    required this.defaultImage,
    required this.imagePath,
    required this.rateCurrency,
    required this.saleCurrency,
    required this.wallet,
    required this.tradeInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseUrl: json["base_url"],
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        rateCurrency: List<ECurrency>.from(
            json["rate_currency"].map((x) => ECurrency.fromJson(x))),
        saleCurrency: List<ECurrency>.from(
            json["sale_currency"].map((x) => ECurrency.fromJson(x))),
        wallet: Wallet.fromJson(json["wallet"]),
        tradeInfo: TradeInfo.fromJson(json["trade_info"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "default_image": defaultImage,
        "image_path": imagePath,
        "rate_currency":
            List<dynamic>.from(rateCurrency.map((x) => x.toJson())),
        "sale_currency":
            List<dynamic>.from(saleCurrency.map((x) => x.toJson())),
        "wallet": wallet.toJson(),
        "trade_info": tradeInfo.toJson(),
      };
}

class Wallet {
  int id;
  dynamic flag;
  String code;
  String balance;
  String name;

  Wallet({
    required this.id,
    this.flag,
    required this.code,
    required this.balance,
    required this.name,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        flag: json["flag"] ?? '',
        code: json["code"],
        balance: json["balance"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flag": flag,
        "code": code,
        "balance": balance,
        "name": name,
      };
}

class TradeInfo {
  String minLimit;
  String maxLimit;

  TradeInfo({
    required this.minLimit,
    required this.maxLimit,
  });

  factory TradeInfo.fromJson(Map<String, dynamic> json) => TradeInfo(
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
      );

  Map<String, dynamic> toJson() => {
        "min_limit": minLimit,
        "max_limit": maxLimit,
      };
}

class ECurrency implements DropdownModel {
  int id;
  String code;
  String symbol;
  dynamic flag;
  String rate;

  ECurrency({
    required this.id,
    required this.code,
    required this.symbol,
    this.flag,
    required this.rate,
  });

  factory ECurrency.fromJson(Map<String, dynamic> json) => ECurrency(
        id: json["id"],
        code: json["code"],
        symbol: json["symbol"],
        flag: json["flag"] ?? '',
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "symbol": symbol,
        "flag": flag,
        "rate": rate,
      };

  @override
  String get img => flag;

  @override
  String get title => code;
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
