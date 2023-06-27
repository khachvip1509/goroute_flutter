import 'dart:convert';

class PersonModel {
  String? name;
  int? age;
  String? addr;

  PersonModel({this.name, this.age, this.addr});

  PersonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    age = json['age'] ?? 0;
    addr = json['addr'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }

  String jsonString() {
    return jsonEncode(toJson());
  }

  static List<PersonModel> fromListOfResponse(List<dynamic> list) {
    //
    return list.map((e) => PersonModel.fromJson(e)).toList();
  }
}
