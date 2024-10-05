
import 'dart:convert';

TradeEditInfoModel tradeEditInfoModelFromJson(String str) => TradeEditInfoModel.fromJson(json.decode(str));

String tradeEditInfoModelToJson(TradeEditInfoModel data) => json.encode(data.toJson());

class TradeEditInfoModel {
    Message message;
    Data data;

    TradeEditInfoModel({
        required this.message,
        required this.data,
    });

    factory TradeEditInfoModel.fromJson(Map<String, dynamic> json) => TradeEditInfoModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    Trade trade;

    Data({
        required this.trade,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        trade: Trade.fromJson(json["trade"]),
    );

    Map<String, dynamic> toJson() => {
        "trade": trade.toJson(),
    };
}

class Trade {
    int id;
    String amount;
    String rate;
    ECurrency saleCurrency;
    ECurrency rateCurrency;

    Trade({
        required this.id,
        required this.amount,
        required this.rate,
        required this.saleCurrency,
        required this.rateCurrency,
    });

    factory Trade.fromJson(Map<String, dynamic> json) => Trade(
        id: json["id"],
        amount: json["amount"],
        rate: json["rate"],
        saleCurrency: ECurrency.fromJson(json["sale_currency"]),
        rateCurrency: ECurrency.fromJson(json["rate_currency"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "rate": rate,
        "sale_currency": saleCurrency.toJson(),
        "rate_currency": rateCurrency.toJson(),
    };
}

class ECurrency {
    int id;
    String code;
    String symbol;
    String flag;
    String rate;

    ECurrency({
        required this.id,
        required this.code,
        required this.symbol,
        required this.flag,
        required this.rate,
    });

    factory ECurrency.fromJson(Map<String, dynamic> json) => ECurrency(
        id: json["id"],
        code: json["code"],
        symbol: json["symbol"],
        flag: json["flag"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "symbol": symbol,
        "flag": flag,
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
