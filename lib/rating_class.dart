// To be changed; currently using sample API data variables

class Rating {


  final int idRating;
  final int rate;
  final String review;
  final String dateRating;
  final int idResto;
  final int idUser;

  const Rating({
    required this.idRating,
    required this.rate,
    required this.review,
    required this.dateRating,
    required this.idResto,
    required this.idUser,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      idRating: json['id_rating'] as int,
      rate: json['rate'] as int,
      review: json['review'] as String,
      dateRating: json['date_rating'] as String,
      idResto: json['id_resto'] as int,
      idUser: json['id_user'] as int,
    );
  }
}
