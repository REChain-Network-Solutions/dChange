import 'dart:convert';

TwoFaInfoModel twoFaInfoModelFromJson(String str) =>
    TwoFaInfoModel.fromJson(json.decode(str));

String twoFaInfoModelToJson(TwoFaInfoModel data) => json.encode(data.toJson());

class TwoFaInfoModel {
  Message message;
  Data data;

  TwoFaInfoModel({
    required this.message,
    required this.data,
  });

  factory TwoFaInfoModel.fromJson(Map<String, dynamic> json) => TwoFaInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String qrCode;
  String qrSecrete;
  int qrStatus;
  String alert;

  Data({
    required this.qrCode,
    required this.qrSecrete,
    required this.qrStatus,
    required this.alert,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        qrCode: json["qr_code"],
        qrSecrete: json["qr_secrete"],
        qrStatus: json["qr_status"],
        alert: json["alert"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code": qrCode,
        "qr_secrete": qrSecrete,
        "qr_status": qrStatus,
        "alert": alert,
      };
}

class Message {
  List<String> message;

  Message({
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: List<String>.from(json["message"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
      };
}
