class HotelListEntity {
  HotelListEntity(this.list);
  List<HotelEntity> list;
}

class HotelEntity {
  HotelEntity({
    required this.id,
    required this.name,
    required this.destination,
    required this.days,
    required this.nights,
    required this.boardingType,
    required this.roomType,
    required this.pricePerPerson,
    required this.totalPrice,
    required this.thumbnailImage,
    required this.adultCount,
    required this.childrenCount,
    required this.flightIncluded,
    required this.reviewsCount,
    required this.score,
    required this.scoreDescription,
  });

  String id;
  String name;
  String destination;
  int days;
  int nights;
  String roomType;
  String boardingType;
  double pricePerPerson;
  double totalPrice;
  String? thumbnailImage;
  bool? flightIncluded;
  int? adultCount;
  int? childrenCount;
  int reviewsCount;
  double score;
  String scoreDescription;
}
