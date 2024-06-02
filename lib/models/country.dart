import 'package:hiringbell/models/constants.dart';

class Country {
  final int id;
  final String? iso;
  final String? name;
  final String? niceName;
  final String? iso3;
  final int? numCode;
  final String? phoneCode;

  Country({
    required this.id,
    this.iso,
    this.name,
    this.niceName,
    this.iso3,
    this.numCode,
    this.phoneCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      iso: json['iSO'],
      name: json['name'],
      niceName: json['niceName'],
      iso3: json['iSO3'],
      numCode: json['numCode'],
      phoneCode: json['phoneCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iSO': iso,
      'name': name,
      'niceName': niceName,
      'iSO3': iso3,
      'numCode': numCode,
      'phoneCode': phoneCode,
    };
  }

  @override
  String toString() {
    return name ?? Constants.empty;
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<Country> countries) {
    return countries.map((country) => country.toJson()).toList();
  }
}
