
import 'dart:convert';

FeeCalculatorInfoModel feeCalculatorInfoModelFromJson(String str) => FeeCalculatorInfoModel.fromJson(json.decode(str));

String feeCalculatorInfoModelToJson(FeeCalculatorInfoModel data) => json.encode(data.toJson());

class FeeCalculatorInfoModel {
    Message message;
    Data data;

    FeeCalculatorInfoModel({
        required this.message,
        required this.data,
    });

    factory FeeCalculatorInfoModel.fromJson(Map<String, dynamic> json) => FeeCalculatorInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    List<Currency> currencies;
    Currency defaultCurrency;
    String fee;
    String amount;

    Data({
        required this.currencies,
        required this.defaultCurrency,
        required this.fee,
        required this.amount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
        defaultCurrency: Currency.fromJson(json["default_currency"]),
        fee: json["fee"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "default_currency": defaultCurrency.toJson(),
        "fee": fee,
        "amount": amount,
    };
}

class Currency {
    int id;
    String code;
    String rate;

    Currency({
        required this.id,
        required this.code,
        required this.rate,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        code: json["code"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "rate": rate,
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
