import 'dart:convert';

OtpVerificationModel otpVerificationModelFromJson(String str) =>
    OtpVerificationModel.fromJson(json.decode(str));

String otpVerificationModelToJson(OtpVerificationModel data) =>
    json.encode(data.toJson());

class OtpVerificationModel {
  Message message;
  Data data;

  OtpVerificationModel({
    required this.message,
    required this.data,
  });

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) =>
      OtpVerificationModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  PasswordResetData passwordResetData;

  Data({
    required this.passwordResetData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        passwordResetData:
            PasswordResetData.fromJson(json["password_reset_data"]),
      );

  Map<String, dynamic> toJson() => {
        "password_reset_data": passwordResetData.toJson(),
      };
}

class PasswordResetData {
  String token;

  PasswordResetData({
    required this.token,
  });

  factory PasswordResetData.fromJson(Map<String, dynamic> json) =>
      PasswordResetData(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
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
