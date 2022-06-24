// To be changed; currently using sample API data variables

class Resto {
  final int id;
  final String name;
  final String category;
  final String desc;
  final double latitude;
  final double longitude;
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
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      desc: json['desc'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      imageLink: json['imageLink'] as String,
      googleMapsLink: json['googleMapsLink'] as String,
    );
  }
}
