class Language {
  final String name;
  final String code;
  final String dir;
  final bool status;
  final Map<String, String> translateKeyValues;

  Language({
    required this.name,
    required this.code,
    required this.dir,
    required this.status,
    required this.translateKeyValues,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json["name"],
      code: json["code"],
      dir: json["dir"],
      status: json["status"],
      translateKeyValues:
          Map<String, String>.from(json["translate_key_values"],),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "dir": dir,
      "status": status,
      "translate_key_values": translateKeyValues,
    };
  }
}
