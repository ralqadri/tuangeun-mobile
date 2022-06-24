// To be changed; currently using sample API data variables

class Resto {
  final int id;
  final String name;
  final String category;
  final String desc;
  final String latitude;
  final String longitude;
  final String imageLink;
  final String googleMapsLink;

  const Resto({
    required this.id,
    required this.name,
    required this.category,
    required this.desc,
    required this.latitude,
    required this.longitude,
    required this.imageLink,
    required this.googleMapsLink,
  });

  factory Resto.fromJson(Map<String, dynamic> json) {
    return Resto(
      id: json['id_resto'] as int,
      name: json['name_resto'] as String,
      category: json['category'] as String,
      desc: json['desc_resto'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      imageLink: json['imageLink'] as String,
      googleMapsLink: json['googleMapsLink'] as String,
    );
  }
}
