// ignore_for_file: file_names

class StateModel {
  final String name;
  final String countryCode;
  final String isoCode;
  final String? latitude;
  final String? longitude;

  StateModel({
    required this.name,
    required this.countryCode,
    required this.isoCode,
    this.latitude,
    this.longitude,
  });

  static StateModel fromJson(Map<String, dynamic> json) => StateModel(
        name: json['name'],
        countryCode: json['countryCode'],
        isoCode: json['isoCode'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'countryCode': countryCode,
        'isoCode': isoCode,
        'latitude': latitude,
        'longitude': longitude,
      };
}
