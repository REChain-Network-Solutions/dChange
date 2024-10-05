// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

ProfileInfoModel profileInfoModelFromJson(String str) =>
    ProfileInfoModel.fromJson(json.decode(str));

String profileInfoModelToJson(ProfileInfoModel data) =>
    json.encode(data.toJson());

class ProfileInfoModel {
  Message message;
  Data data;

  ProfileInfoModel({
    required this.message,
    required this.data,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoModel(
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
  String baseUr;
  User user;

  Data({
    required this.defaultImage,
    required this.imagePath,
    required this.baseUr,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        defaultImage: json["default_image"],
        imagePath: json["image_path"],
        baseUr: json["base_ur"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "default_image": defaultImage,
        "image_path": imagePath,
        "base_ur": baseUr,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String firstName;
  String lastName;
  dynamic mobileCode;
  dynamic mobile;
  dynamic fullMobile;
  Address address;
  dynamic email;
  dynamic image;
  int emailVerified;
  int kycVerified;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.mobileCode,
    this.mobile,
    this.fullMobile,
    required this.address,
    this.email,
    this.image,
    required this.emailVerified,
    required this.kycVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobileCode: json["mobile_code"] ?? '',
        mobile: json["mobile"] ?? '',
        fullMobile: json["full_mobile"] ?? '',
        address: Address.fromJson(json["address"]),
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        emailVerified: json["email_verified"],
        kycVerified: json["kyc_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "full_mobile": fullMobile,
        "address": address.toJson(),
        "email": email,
        "image": image,
        "email_verified": emailVerified,
        "kyc_verified": kycVerified,
      };
}

class Address {
  dynamic country;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  dynamic address;

  Address({
    this.country,
    this.city,
    this.state,
    this.zipCode,
    this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"] ?? '',
        city: json["city"] ?? '',
        state: json["state"] ?? '',
        zipCode: json["zip_code"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "address": address,
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
