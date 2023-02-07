import 'dart:convert';

ContactSupport contactSupportFromJson(String str) =>
    ContactSupport.fromJson(json.decode(str));

String contactSupportToJson(ContactSupport data) => json.encode(data.toJson());

class ContactSupport {
  ContactSupport({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory ContactSupport.fromJson(Map<String, dynamic> json) => ContactSupport(
        url: json["url"] ?? "",
        text: json["text"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
