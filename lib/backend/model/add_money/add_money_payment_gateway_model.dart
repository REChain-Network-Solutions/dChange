import 'dart:convert';

AddMoneyPaymentGatewayModel addMoneyPaymentGatewayModelFromJson(String str) =>
    AddMoneyPaymentGatewayModel.fromJson(json.decode(str));

String addMoneyPaymentGatewayModelToJson(AddMoneyPaymentGatewayModel data) =>
    json.encode(data.toJson());

class AddMoneyPaymentGatewayModel {
  Message message;
  Data data;

  AddMoneyPaymentGatewayModel({
    required this.message,
    required this.data,
  });

  factory AddMoneyPaymentGatewayModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyPaymentGatewayModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  dynamic baseCurr;
  int baseCurrRate;
  dynamic defaultImage;
  dynamic imagePath;
  UserWallet userWallet;
  List<Gateway> gateways;
  List<Transactionss> transactionss;

  Data({
    required this.baseCurr,
    required this.baseCurrRate,
    required this.defaultImage,
    required this.imagePath,
    required this.userWallet,
    required this.gateways,
    required this.transactionss,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        baseCurr: json["base_curr"] ?? "",
        baseCurrRate: json["base_curr_rate"],
        defaultImage: json["default_image"] ?? "",
        imagePath: json["image_path"] ?? "",
        userWallet: UserWallet.fromJson(json["userWallet"]),
        gateways: List<Gateway>.from(
            json["gateways"].map((x) => Gateway.fromJson(x))),
        transactionss: List<Transactionss>.from(
            json["transactionss"].map((x) => Transactionss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "base_curr_rate": baseCurrRate,
        "default_image": defaultImage,
        "image_path": imagePath,
        "userWallet": userWallet.toJson(),
        "gateways": List<dynamic>.from(gateways.map((x) => x.toJson())),
        "transactionss":
            List<dynamic>.from(transactionss.map((x) => x.toJson())),
      };
}

class Gateway {
  int id;
  dynamic image;
  dynamic slug;
  int code;
  dynamic type;
  dynamic alias;
  List<String> supportedCurrencies;
  int status;
  List<Currency> currencies;

  Gateway({
    required this.id,
    required this.image,
    required this.slug,
    required this.code,
    required this.type,
    required this.alias,
    required this.supportedCurrencies,
    required this.status,
    required this.currencies,
  });

  factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        id: json["id"],
        image: json["image"] ?? "",
        slug: json["slug"] ?? "",
        code: json["code"],
        type: json["type"] ?? "",
        alias: json["alias"] ?? "",
        supportedCurrencies:
            List<String>.from(json["supported_currencies"].map((x) => x)),
        status: json["status"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "slug": slug,
        "code": code,
        "type": type,
        "alias": alias,
        "supported_currencies":
            List<dynamic>.from(supportedCurrencies.map((x) => x)),
        "status": status,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency {
  int id;
  int paymentGatewayId;
  dynamic type;
  dynamic name;
  dynamic alias;
  dynamic currencyCode;
  dynamic currencySymbol;
  dynamic image;
  int minLimit;
  int maxLimit;
  int percentCharge;
  int fixedCharge;
  double rate;
  DateTime createdAt;
  DateTime updatedAt;

  Currency({
    required this.id,
    required this.paymentGatewayId,
    required this.type,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        type: json["type"] ?? "",
        name: json["name"] ?? "",
        alias: json["alias"] ?? "",
        currencyCode: json["currency_code"] ?? "",
        currencySymbol: json["currency_symbol"] ?? "",
        image: json["image"] ?? "",
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "type": type,
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Transactionss {
  int id;
  dynamic trx;
  dynamic gatewayName;
  dynamic transactionType;
  dynamic requestAmount;
  dynamic payable;
  dynamic exchangeRate;
  dynamic totalCharge;
  dynamic currentBalance;
  dynamic status;
  DateTime dateTime;
  StatusInfo statusInfo;
  dynamic rejectionReason;

  Transactionss({
    required this.id,
    required this.trx,
    required this.gatewayName,
    required this.transactionType,
    required this.requestAmount,
    required this.payable,
    required this.exchangeRate,
    required this.totalCharge,
    required this.currentBalance,
    required this.status,
    required this.dateTime,
    required this.statusInfo,
    required this.rejectionReason,
  });

  factory Transactionss.fromJson(Map<String, dynamic> json) => Transactionss(
        id: json["id"],
        trx: json["trx"] ?? "",
        gatewayName: json["gateway_name"] ?? "",
        transactionType: json["transaction_type"] ?? "",
        requestAmount: json["request_amount"] ?? "",
        payable: json["payable"] ?? "",
        exchangeRate: json["exchange_rate"] ?? "",
        totalCharge: json["total_charge"] ?? "",
        currentBalance: json["current_balance"] ?? "",
        status: json["status"] ?? "",
        dateTime: DateTime.parse(json["date_time"]),
        statusInfo: StatusInfo.fromJson(json["status_info"]),
        rejectionReason: json["rejection_reason"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trx": trx,
        "gateway_name": gatewayName,
        "transaction_type": transactionType,
        "request_amount": requestAmount,
        "payable": payable,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "current_balance": currentBalance,
        "status": status,
        "date_time": dateTime.toIso8601String(),
        "status_info": statusInfo.toJson(),
        "rejection_reason": rejectionReason,
      };
}

class StatusInfo {
  int success;
  int pending;
  int rejected;

  StatusInfo({
    required this.success,
    required this.pending,
    required this.rejected,
  });

  factory StatusInfo.fromJson(Map<String, dynamic> json) => StatusInfo(
        success: json["success"],
        pending: json["pending"],
        rejected: json["rejected"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "pending": pending,
        "rejected": rejected,
      };
}

class UserWallet {
  double balance;
  dynamic currency;

  UserWallet({
    required this.balance,
    required this.currency,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
        balance: json["balance"]?.toDouble(),
        currency: json["currency"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "currency": currency,
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
