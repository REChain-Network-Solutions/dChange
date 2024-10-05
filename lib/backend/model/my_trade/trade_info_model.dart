import 'dart:convert';

MyTradeInfoModel myTradeInfoModelFromJson(String str) =>
    MyTradeInfoModel.fromJson(json.decode(str));

String myTradeInfoModelToJson(MyTradeInfoModel data) =>
    json.encode(data.toJson());

class MyTradeInfoModel {
  Message message;
  Data data;

  MyTradeInfoModel({
    required this.message,
    required this.data,
  });

  factory MyTradeInfoModel.fromJson(Map<String, dynamic> json) =>
      MyTradeInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<MyTrade> myTrade;

  Data({
    required this.myTrade,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        myTrade: List<MyTrade>.from(
            json["my_trade"].map((x) => MyTrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "my_trade": List<dynamic>.from(myTrade.map((x) => x.toJson())),
      };
}

class MyTrade {
  int id;
  int forexcrowId;
  String trx;
  String buyerWillPay;
  String buyerWillGet;
  String rateCurrency;
  String saleCurrency;
  String status;
  DateTime createdAt;

  MyTrade({
    required this.id,
    required this.forexcrowId,
    required this.trx,
    required this.buyerWillPay,
    required this.buyerWillGet,
    required this.rateCurrency,
    required this.saleCurrency,
    required this.status,
    required this.createdAt,
  });

  factory MyTrade.fromJson(Map<String, dynamic> json) => MyTrade(
        id: json["id"],
        trx: json["trx"],
        buyerWillPay: json["buyer_will_pay"],
        buyerWillGet: json["buyer_will_get"],
        rateCurrency: json["rate_currency"],
        saleCurrency: json["sale_currency"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        forexcrowId: json["forexcrow_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "forexcrow_id": forexcrowId,
        "trx": trx,
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
