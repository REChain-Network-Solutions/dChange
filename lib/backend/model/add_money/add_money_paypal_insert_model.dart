import 'dart:convert';

AddMoneyPaypalInsertModel addMoneyPaypalInsertModelFromJson(String str) =>
    AddMoneyPaypalInsertModel.fromJson(json.decode(str));

String addMoneyPaypalInsertModelToJson(AddMoneyPaypalInsertModel data) =>
    json.encode(data.toJson());

class AddMoneyPaypalInsertModel {
  AddMoneyPaypalInsertModel({
    required this.message,
    required this.data,
  });

  final Message message;
  final Data data;

  factory AddMoneyPaypalInsertModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyPaypalInsertModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.gategayType,
    required this.gatewayCurrencyName,
    required this.alias,
    required this.identify,
    required this.paymentInformations,
    required this.url,
    required this.method,
  });

  final String gategayType;
  final String gatewayCurrencyName;
  final String alias;
  final String identify;
  final PaymentInformations paymentInformations;
  final List<Url> url;
  final String method;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gategayType: json["gategay_type"],
        gatewayCurrencyName: json["gateway_currency_name"],
        alias: json["alias"],
        identify: json["identify"],
        paymentInformations:
            PaymentInformations.fromJson(json["payment_informations"]),
        url: List<Url>.from(json["url"].map((x) => Url.fromJson(x))),
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "gategay_type": gategayType,
        "gateway_currency_name": gatewayCurrencyName,
        "alias": alias,
        "identify": identify,
        "payment_informations": paymentInformations.toJson(),
        "url": List<dynamic>.from(url.map((x) => x.toJson())),
        "method": method,
      };
}

class PaymentInformations {
  PaymentInformations({
    required this.trx,
    required this.gatewayCurrencyName,
    required this.requestAmount,
    required this.exchangeRate,
    required this.totalCharge,
    required this.willGet,
    required this.payableAmount,
  });

  final String trx;
  final String gatewayCurrencyName;
  final String requestAmount;
  final String exchangeRate;
  final String totalCharge;
  final String willGet;
  final String payableAmount;

  factory PaymentInformations.fromJson(Map<String, dynamic> json) =>
      PaymentInformations(
        trx: json["trx"],
        gatewayCurrencyName: json["gateway_currency_name"],
        requestAmount: json["request_amount"],
        exchangeRate: json["exchange_rate"],
        totalCharge: json["total_charge"],
        willGet: json["will_get"],
        payableAmount: json["payable_amount"],
      );

  Map<String, dynamic> toJson() => {
        "trx": trx,
        "gateway_currency_name": gatewayCurrencyName,
        "request_amount": requestAmount,
        "exchange_rate": exchangeRate,
        "total_charge": totalCharge,
        "will_get": willGet,
        "payable_amount": payableAmount,
      };
}

class Url {
  Url({
    required this.href,
    required this.rel,
    required this.method,
  });

  final String href;
  final String rel;
  final String method;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        href: json["href"],
        rel: json["rel"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "rel": rel,
        "method": method,
      };
}

class Message {
  Message({
    required this.success,
  });

  final List<String> success;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
