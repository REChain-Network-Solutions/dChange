import 'dart:convert';

MarketplaceLatestTransactionModel marketplaceLatestTransactionModelFromJson(
        String str) =>
    MarketplaceLatestTransactionModel.fromJson(json.decode(str));

String marketplaceLatestTransactionModelToJson(
        MarketplaceLatestTransactionModel data) =>
    json.encode(data.toJson());

class MarketplaceLatestTransactionModel {
  Message message;
  Data data;

  MarketplaceLatestTransactionModel({
    required this.message,
    required this.data,
  });

  factory MarketplaceLatestTransactionModel.fromJson(
          Map<String, dynamic> json) =>
      MarketplaceLatestTransactionModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<LatestTransaction> latestTransaction;

  Data({
    required this.latestTransaction,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        latestTransaction: List<LatestTransaction>.from(
            json["latest_transaction"]
                .map((x) => LatestTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "latest_transaction":
            List<dynamic>.from(latestTransaction.map((x) => x.toJson())),
      };
}

class LatestTransaction {
  int id;
  dynamic trx;
  String transactinType;
  String requestAmount;
  String payable;
  String totalCharge;
  String buyerWillPay;
  String buyerWillGet;
  String rateCurrency;
  String saleCurrency;
  String status;
  DateTime createdAt;

  LatestTransaction({
    required this.id,
    this.trx,
    required this.transactinType,
    required this.requestAmount,
    required this.payable,
    required this.totalCharge,
    required this.buyerWillPay,
    required this.buyerWillGet,
    required this.rateCurrency,
    required this.saleCurrency,
    required this.status,
    required this.createdAt,
  });

  factory LatestTransaction.fromJson(Map<String, dynamic> json) =>
      LatestTransaction(
        id: json["id"],
        trx: json["trx"] ?? '',
        transactinType: json["transactin_type"],
        requestAmount: json["request_amount"],
        payable: json["payable"],
        totalCharge: json["total_charge"],
        buyerWillPay: json["buyer_will_pay"],
        buyerWillGet: json["buyer_will_get"],
        rateCurrency: json["rate_currency"],
        saleCurrency: json["sale_currency"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx": trx,
        "transactin_type": transactinType,
        "request_amount": requestAmount,
        "payable": payable,
        "total_charge": totalCharge,
        "buyer_will_pay": buyerWillPay,
        "buyer_will_get": buyerWillGet,
        "rate_currency": rateCurrency,
        "sale_currency": saleCurrency,
        "status": status,
        "created_at": createdAt.toIso8601String(),
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
