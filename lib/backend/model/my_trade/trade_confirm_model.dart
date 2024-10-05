import 'dart:convert';

TradeConfirmModel tradeConfirmModelFromJson(String str) =>
    TradeConfirmModel.fromJson(json.decode(str));

String tradeConfirmModelToJson(TradeConfirmModel data) =>
    json.encode(data.toJson());

class TradeConfirmModel {
  Message message;
  Data data;

  TradeConfirmModel({
    required this.message,
    required this.data,
  });

  factory TradeConfirmModel.fromJson(Map<String, dynamic> json) =>
      TradeConfirmModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String qrcode;
  String url;
  int id;

  Data({
    required this.qrcode,
    required this.url,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        qrcode: json["qrcode"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "qrcode": qrcode,
        "url": url,
        "id": id,
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
