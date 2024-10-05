import 'dart:convert';

TradeSubmitModel tradeSubmitModelFromJson(String str) =>
    TradeSubmitModel.fromJson(json.decode(str));

String tradeSubmitModelToJson(TradeSubmitModel data) =>
    json.encode(data.toJson());

class TradeSubmitModel {
  Message message;
  TradeSubmitModelData data;

  TradeSubmitModel({
    required this.message,
    required this.data,
  });

  factory TradeSubmitModel.fromJson(Map<String, dynamic> json) =>
      TradeSubmitModel(
        message: Message.fromJson(json["message"]),
        data: TradeSubmitModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class TradeSubmitModelData {
  String trxId;
  DataData data;

  TradeSubmitModelData({
    required this.trxId,
    required this.data,
  });

  factory TradeSubmitModelData.fromJson(Map<String, dynamic> json) =>
      TradeSubmitModelData(
        trxId: json["trx_id"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "data": data.toJson(),
      };
}

class DataData {
  String currency;
  String rateCurrency;
  String amount;
  String rate;
  String transactionType;
  dynamic subtotal;
  String rateCurrencyCode;
  String saleCurrencyCode;
  dynamic fixedCharge;
  dynamic percentCharge;
  dynamic totalCharge;
  dynamic totalAmount;

  DataData({
    required this.currency,
    required this.rateCurrency,
    required this.amount,
    required this.rate,
    required this.transactionType,
    this.subtotal,
    required this.rateCurrencyCode,
    required this.saleCurrencyCode,
    this.fixedCharge,
    this.percentCharge,
    this.totalCharge,
    this.totalAmount,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        currency: json["currency"],
        rateCurrency: json["rate_currency"],
        amount: json["amount"],
        rate: json["rate"],
        transactionType: json["transaction_type"],
        subtotal: json["subtotal"]?.toDouble() ?? 0.0,
        rateCurrencyCode: json["rate_currency_code"],
        saleCurrencyCode: json["sale_currency_code"],
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        percentCharge: json["percent_charge"]?.toDouble() ?? 0.0,
        totalCharge: json["total_charge"]?.toDouble() ?? 0.0,
        totalAmount: json["total_amount"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "rate_currency": rateCurrency,
        "amount": amount,
        "rate": rate,
        "transaction_type": transactionType,
        "subtotal": subtotal,
        "rate_currency_code": rateCurrencyCode,
        "sale_currency_code": saleCurrencyCode,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "total_charge": totalCharge,
        "total_amount": totalAmount,
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
