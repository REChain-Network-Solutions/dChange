import 'dart:convert';

import '../../../widgets/common/custom_drop_down/custom_drop_down.dart';

OfferBuyModel offerBuyModelFromJson(String str) =>
    OfferBuyModel.fromJson(json.decode(str));

String offerBuyModelToJson(OfferBuyModel data) => json.encode(data.toJson());

class OfferBuyModel {
  Message message;
  Data data;

  OfferBuyModel({
    required this.message,
    required this.data,
  });

  factory OfferBuyModel.fromJson(Map<String, dynamic> json) => OfferBuyModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<PaymentGateway> paymentGatewaies;
  List<Wallet> wallet;
  dynamic totalCharge;
  Trade trade;
  String target;

  Data({
    required this.paymentGatewaies,
    required this.wallet,
    this.totalCharge,
    required this.trade,
    required this.target,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentGatewaies: List<PaymentGateway>.from(
            json["payment_gatewaies"].map((x) => PaymentGateway.fromJson(x))),
        wallet:
            List<Wallet>.from(json["wallet"].map((x) => Wallet.fromJson(x))),
        totalCharge: json["total_charge"]?.toDouble() ?? 0.0,
        trade: Trade.fromJson(json["trade"]),
        target: json["target"],
      );

  Map<String, dynamic> toJson() => {
        "payment_gatewaies":
            List<dynamic>.from(paymentGatewaies.map((x) => x.toJson())),
        "wallet": List<dynamic>.from(wallet.map((x) => x.toJson())),
        "total_charge": totalCharge,
        "trade": trade.toJson(),
        "target": target,
      };
}

class PaymentGateway implements DropdownModel {
  int id;
  String name;

  PaymentGateway({
    required this.id,
    required this.name,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String get img => '';

  @override
  String get title => name;
}

class Trade {
  int id;
  String amount;
  String rate;
  ECurrency saleCurrency;
  ECurrency rateCurrency;
  int userId;

  Trade({
    required this.id,
    required this.amount,
    required this.rate,
    required this.saleCurrency,
    required this.rateCurrency,
    required this.userId,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => Trade(
        id: json["id"],
        amount: json["amount"],
        rate: json["rate"],
        saleCurrency: ECurrency.fromJson(json["sale_currency"]),
        rateCurrency: ECurrency.fromJson(json["rate_currency"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "rate": rate,
        "sale_currency": saleCurrency.toJson(),
        "rate_currency": rateCurrency.toJson(),
        "user_id": userId,
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

class Wallet {
  int id;
  String balance;

  Wallet({
    required this.id,
    required this.balance,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "balance": balance,
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
