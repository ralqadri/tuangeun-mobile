class Resto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Resto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Resto.fromJson(Map<String, dynamic> json) {
    return Resto(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
