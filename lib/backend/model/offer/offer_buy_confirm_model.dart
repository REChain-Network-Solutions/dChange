import 'dart:convert';

OfferBuyConfirmModel offerBuyConfirmModelFromJson(String str) =>
    OfferBuyConfirmModel.fromJson(json.decode(str));

String offerBuyConfirmModelToJson(OfferBuyConfirmModel data) =>
    json.encode(data.toJson());

class OfferBuyConfirmModel {
  Message message;
  Data data;

  OfferBuyConfirmModel({
    required this.message,
    required this.data,
  });

  factory OfferBuyConfirmModel.fromJson(Map<String, dynamic> json) =>
      OfferBuyConfirmModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  String trxId;
  List<PaymentField> paymentFields;

  Data({
    required this.trxId,
    required this.paymentFields,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trxId: json["trx_id"],
        paymentFields: List<PaymentField>.from(
            json["payment_fields"].map((x) => PaymentField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "trx_id": trxId,
        "payment_fields":
            List<dynamic>.from(paymentFields.map((x) => x.toJson())),
      };
}

class PaymentField {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;

  PaymentField({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory PaymentField.fromJson(Map<String, dynamic> json) => PaymentField(
        type: json["type"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
      };
}

class Validation {
  String max;
  List<String> mimes;
  dynamic min;
  List<dynamic> options;
  bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        mimes: List<String>.from(json["mimes"].map((x) => x)),
        min: json["min"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "mimes": List<dynamic>.from(mimes.map((x) => x)),
        "min": min,
        "options": List<dynamic>.from(options.map((x) => x)),
        "required": required,
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
