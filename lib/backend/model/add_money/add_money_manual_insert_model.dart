import 'dart:convert';

AddMoneyManualInsertModel addMoneyManualInsertModelFromJson(String str) =>
    AddMoneyManualInsertModel.fromJson(json.decode(str));

String addMoneyManualInsertModelToJson(AddMoneyManualInsertModel data) =>
    json.encode(data.toJson());

class AddMoneyManualInsertModel {
  AddMoneyManualInsertModel({
    required this.message,
    required this.data,
  });

  final Message message;
  final Data data;

  factory AddMoneyManualInsertModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyManualInsertModel(
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
    required this.details,
    required this.inputFields,
    required this.paymentInformations,
    required this.url,
    required this.method,
  });

  final String gategayType;
  final String gatewayCurrencyName;
  final String alias;
  final String identify;
  final String details;
  final List<InputField> inputFields;
  final PaymentInformations paymentInformations;
  final String url;
  final String method;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gategayType: json["gategay_type"],
        gatewayCurrencyName: json["gateway_currency_name"],
        alias: json["alias"],
        identify: json["identify"],
        details: json["details"],
        inputFields: List<InputField>.from(
            json["input_fields"].map((x) => InputField.fromJson(x))),
        paymentInformations:
            PaymentInformations.fromJson(json["payment_informations"]),
        url: json["url"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "gategay_type": gategayType,
        "gateway_currency_name": gatewayCurrencyName,
        "alias": alias,
        "identify": identify,
        "details": details,
        "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
        "payment_informations": paymentInformations.toJson(),
        "url": url,
        "method": method,
      };
}

class InputField {
  InputField({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
  });

  final String type;
  final String label;
  final String name;
  final bool required;
  final Validation validation;

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
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
  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  final String max;
  final List<dynamic> mimes;
  final String min;
  final List<dynamic> options;
  final bool required;

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        mimes: List<dynamic>.from(json["mimes"].map((x) => x)),
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
