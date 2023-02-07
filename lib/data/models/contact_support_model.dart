import 'dart:convert';

ContactSupport contactSupportFromJson(String str) =>
    ContactSupport.fromJson(json.decode(str));

String contactSupportToJson(ContactSupport data) => json.encode(data.toJson());

class ContactSupport {
  ContactSupport({
    required this.data,
    required this.support,
  });

  Data data;
  Support support;

  factory ContactSupport.fromJson(Map<String, dynamic> json) => ContactSupport(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "support": support.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        year: json["year"] ?? 0,
        color: json["color"] ?? '',
        pantoneValue: json["pantone_value"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "color": color,
        "pantone_value": pantoneValue,
      };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"] ?? '',
        text: json["text"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
