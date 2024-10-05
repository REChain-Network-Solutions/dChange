// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

GetOfferModel getOfferModelFromJson(String str) =>
    GetOfferModel.fromJson(json.decode(str));

String getOfferModelToJson(GetOfferModel data) => json.encode(data.toJson());

class GetOfferModel {
  Message message;
  Data data;

  GetOfferModel({
    required this.message,
    required this.data,
  });

  factory GetOfferModel.fromJson(Map<String, dynamic> json) => GetOfferModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String defaultImage;
  String imagePath;
  List<GetOffer> getOffers;

  Data({
    required this.defaultImage,
    required this.imagePath,
    required this.getOffers,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        getOffers: List<GetOffer>.from(
            json["get_offers"].map((x) => GetOffer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default_image": defaultImage,
        "image_path": imagePath,
        "get_offers": List<dynamic>.from(getOffers.map((x) => x.toJson())),
      };
}

class GetOffer {
  int id;
  String type;
  String amount;
  String saleCurrencyCode;
  String rate;
  String rateCurrencyCode;
  int creatorId;
  int forUserId;
  int receiverId;
  int tradeId;
  int status;
  DateTime offerCreated;
  dynamic creatorImage;
  int emailVerified;
  int kycVerified;
  String creatorName;
  String tradeAmount;
  String tradeRate;
  int tradeStatus;

  GetOffer({
    required this.id,
    required this.type,
    required this.amount,
    required this.saleCurrencyCode,
    required this.rate,
    required this.rateCurrencyCode,
    required this.creatorId,
    required this.forUserId,
    required this.receiverId,
    required this.tradeId,
    required this.status,
    required this.offerCreated,
    this.creatorImage,
    required this.emailVerified,
    required this.kycVerified,
    required this.creatorName,
    required this.tradeAmount,
    required this.tradeRate,
    required this.tradeStatus,
  });

  factory GetOffer.fromJson(Map<String, dynamic> json) => GetOffer(
        id: json["id"],
        type: json["type"],
        amount: json["amount"],
        saleCurrencyCode: json["sale_currency_code"],
        rate: json["rate"],
        rateCurrencyCode: json["rate_currency_code"],
        creatorId: json["creator_id"],
        receiverId: json["receiver_id"],
        tradeId: json["trade_id "],
        status: json["status"],
        offerCreated: DateTime.parse(json["offer_created"]),
        creatorImage: json["creator_image"] ?? '',
        creatorName: json["creator_name"],
        tradeAmount: json["trade_amount"],
        tradeRate: json["trade_rate"],
        tradeStatus: json["trade_status"],
        forUserId: json['for_user_id'],
        emailVerified: json['email_verified'],
        kycVerified: json['kyc_verified'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "amount": amount,
        "sale_currency_code": saleCurrencyCode,
        "rate": rate,
        "rate_currency_code": rateCurrencyCode,
        "creator_id": creatorId,
        "for_user_id": forUserId,
        "receiver_id": receiverId,
        "trade_id ": tradeId,
        "status": status,
        "offer_created": offerCreated.toIso8601String(),
        "creator_image": creatorImage,
        "email_verified": emailVerified,
        "kyc_verified": kycVerified,
        "creator_name": creatorName,
        "trade_amount": tradeAmount,
        "trade_rate": tradeRate,
        "trade_status": tradeStatus,
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
