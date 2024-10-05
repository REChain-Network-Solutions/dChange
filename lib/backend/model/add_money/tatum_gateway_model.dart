import 'dart:convert';

TatumGatewayModel tatumGatewayModelFromJson(String str) =>
    TatumGatewayModel.fromJson(json.decode(str));

String tatumGatewayModelToJson(TatumGatewayModel data) =>
    json.encode(data.toJson());

class TatumGatewayModel {
  final Message message;
  final Data data;

  TatumGatewayModel({
    required this.message,
    required this.data,
  });

  factory TatumGatewayModel.fromJson(Map<String, dynamic> json) =>
      TatumGatewayModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final String gatewayType;
  final String gatewayCurrencyName;
  final String alias;
  final String identify;
  final PaymentInformations paymentInformations;
  final bool redirectUrl;
  final List<dynamic> redirectLinks;
  final String actionType;
  final AddressInfo addressInfo;

  Data({
    required this.gatewayType,
    required this.gatewayCurrencyName,
    required this.alias,
    required this.identify,
    required this.paymentInformations,
    required this.redirectUrl,
    required this.redirectLinks,
    required this.actionType,
    required this.addressInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gatewayType: json["gateway_type"],
        gatewayCurrencyName: json["gateway_currency_name"],
        alias: json["alias"],
        identify: json["identify"],
        paymentInformations:
            PaymentInformations.fromJson(json["payment_informations"]),
        redirectUrl: json["redirect_url"],
        redirectLinks: List<dynamic>.from(json["redirect_links"].map((x) => x)),
        actionType: json["action_type"],
        addressInfo: AddressInfo.fromJson(json["address_info"]),
      );

  Map<String, dynamic> toJson() => {
        "gateway_type": gatewayType,
        "gateway_currency_name": gatewayCurrencyName,
        "alias": alias,
        "identify": identify,
        "payment_informations": paymentInformations.toJson(),
        "redirect_url": redirectUrl,
        "redirect_links": List<dynamic>.from(redirectLinks.map((x) => x)),
        "action_type": actionType,
        "address_info": addressInfo.toJson(),
      };
}

class AddressInfo {
  final String coin;
  final String address;
  final List<InputField> inputFields;
  final String submitUrl;

  AddressInfo({
    required this.coin,
    required this.address,
    required this.inputFields,
    required this.submitUrl,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) => AddressInfo(
        coin: json["coin"],
        address: json["address"],
        inputFields: List<InputField>.from(
            json["input_fields"].map((x) => InputField.fromJson(x))),
        submitUrl: json["submit_url"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "address": address,
        "input_fields": List<dynamic>.from(inputFields.map((x) => x.toJson())),
        "submit_url": submitUrl,
      };
}

class InputField {
  final String type;
  final String label;
  final String placeholder;
  final String name;
  final bool required;
  final Validation validation;

  InputField({
    required this.type,
    required this.label,
    required this.placeholder,
    required this.name,
    required this.required,
    required this.validation,
  });

  factory InputField.fromJson(Map<String, dynamic> json) => InputField(
        type: json["type"],
        label: json["label"],
        placeholder: json["placeholder"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "placeholder": placeholder,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
      };
}

class Validation {
  final String min;
  final String max;
  final bool required;

  Validation({
    required this.min,
    required this.max,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        min: json["min"],
        max: json["max"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "required": required,
      };
}

class PaymentInformations {
  final String trx;
  final String gatewayCurrencyName;
  final String requestAmount;
  final String exchangeRate;
  final String totalCharge;
  final String willGet;
  final String payableAmount;

  PaymentInformations({
    required this.trx,
    required this.gatewayCurrencyName,
    required this.requestAmount,
    required this.exchangeRate,
    required this.totalCharge,
    required this.willGet,
    required this.payableAmount,
  });

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
  final List<String> success;

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
