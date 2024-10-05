import 'dart:convert';

NotificationInfoModel notificationInfoModelFromJson(String str) =>
    NotificationInfoModel.fromJson(json.decode(str));

String notificationInfoModelToJson(NotificationInfoModel data) =>
    json.encode(data.toJson());

class NotificationInfoModel {
  NotificationInfoModelMessage message;
  Data data;

  NotificationInfoModel({
    required this.message,
    required this.data,
  });

  factory NotificationInfoModel.fromJson(Map<String, dynamic> json) =>
      NotificationInfoModel(
        message: NotificationInfoModelMessage.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  List<Notifications> notifications;

  Data({
    required this.notifications,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<Notifications>.from(
            json["notifications"].map((x) => Notifications.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notifications {
  int id;
  dynamic type;
  NotificationMessage message;
  DateTime createdAt;
  DateTime updatedAt;

  Notifications({
    required this.id,
    required this.type,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        type: json["type"],
        message: NotificationMessage.fromJson(json["message"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "message": message.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class NotificationMessage {
  dynamic title;
  dynamic message;
  dynamic time;
  dynamic image;

  NotificationMessage({
    required this.title,
    required this.message,
    required this.time,
    required this.image,
  });

  factory NotificationMessage.fromJson(Map<String, dynamic> json) =>
      NotificationMessage(
        title: json["title"],
        message: json["message"],
        time: json["time"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "time": time,
        "image": image,
      };
}

class NotificationInfoModelMessage {
  List<String> success;

  NotificationInfoModelMessage({
    required this.success,
  });

  factory NotificationInfoModelMessage.fromJson(Map<String, dynamic> json) =>
      NotificationInfoModelMessage(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
