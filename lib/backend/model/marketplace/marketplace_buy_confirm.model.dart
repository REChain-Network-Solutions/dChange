import 'dart:convert';

MarketplaceBuyConfirmModel marketplaceBuyComfirmModelFromJson(String str) =>
    MarketplaceBuyConfirmModel.fromJson(json.decode(str));

String marketplaceBuyComfirmModelToJson(MarketplaceBuyConfirmModel data) =>
    json.encode(data.toJson());

class MarketplaceBuyConfirmModel {
  Message message;
  MarketplaceBuyConfirmModelData data;

  MarketplaceBuyConfirmModel({
    required this.message,
    required this.data,
  });

  factory MarketplaceBuyConfirmModel.fromJson(Map<String, dynamic> json) =>
      MarketplaceBuyConfirmModel(
        message: Message.fromJson(json["message"]),
        data: MarketplaceBuyConfirmModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class MarketplaceBuyConfirmModelData {
  String trxId;
  List<PaymentField> paymentFields;

  MarketplaceBuyConfirmModelData({
    required this.trxId,
    required this.paymentFields,
  });

  factory MarketplaceBuyConfirmModelData.fromJson(Map<String, dynamic> json) =>
      MarketplaceBuyConfirmModelData(
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

class DataData {
  String target;
  String gatewayId;
  String rateCurrency;
  int paymentGatewayId;
  String willGet;
  String saleCurrency;
  String amount;
  String subtotal;
  Wallet wallet;
  int fixedCharge;
  int percentCharge;
  int totalCharge;
  int totalAmount;
  String transactionType;

  DataData({
    required this.target,
    required this.gatewayId,
    required this.rateCurrency,
    required this.paymentGatewayId,
    required this.willGet,
    required this.saleCurrency,
    required this.amount,
    required this.subtotal,
    required this.wallet,
    required this.fixedCharge,
    required this.percentCharge,
    required this.totalCharge,
    required this.totalAmount,
    required this.transactionType,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        target: json["target"],
        gatewayId: json["gateway_id"],
        rateCurrency: json["rate_currency"],
        paymentGatewayId: json["payment_gateway_id"],
        willGet: json["will_get"],
        saleCurrency: json["sale_currency"],
        amount: json["amount"],
        subtotal: json["subtotal"],
        wallet: Wallet.fromJson(json["wallet"]),
        fixedCharge: json["fixed_charge"],
        percentCharge: json["percent_charge"],
        totalCharge: json["total_charge"],
        totalAmount: json["total_amount"],
        transactionType: json["transaction_type"],
      );

  Map<String, dynamic> toJson() => {
        "target": target,
        "gateway_id": gatewayId,
        "rate_currency": rateCurrency,
        "payment_gateway_id": paymentGatewayId,
        "will_get": willGet,
        "sale_currency": saleCurrency,
        "amount": amount,
        "subtotal": subtotal,
        "wallet": wallet.toJson(),
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "total_charge": totalCharge,
        "total_amount": totalAmount,
        "transaction_type": transactionType,
      };
}

class Wallet {
  int id;
  int userId;
  int currencyId;
  String balance;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Wallet({
    required this.id,
    required this.userId,
    required this.currencyId,
    required this.balance,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        userId: json["user_id"],
        currencyId: json["currency_id"],
        balance: json["balance"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "currency_id": currencyId,
        "balance": balance,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
