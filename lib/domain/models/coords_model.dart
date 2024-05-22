final class CoordsModel {
  final String? name;
  final String? country;
  final double? lat;
  final double? lon;

  const CoordsModel({
    required this.country,
    required this.lat,
    required this.lon,
    required this.name,
  });

  factory CoordsModel.fromJson(Map<String, dynamic> json) {
    return CoordsModel(
      country: json['country'],
      name: json['name'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}

final class CoordsData {
  CoordsModel? data;

  CoordsData({required this.data});

  factory CoordsData.fromJson(List<dynamic> json) {
    return CoordsData(
      data: CoordsModel.fromJson(
        json[0],
      ),
    );
  }
}
