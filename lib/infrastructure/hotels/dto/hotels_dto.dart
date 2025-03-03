import 'package:json_annotation/json_annotation.dart';

part 'hotels_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelsDto {
  List<Hotel>? hotels;

  HotelsDto({this.hotels});

  factory HotelsDto.fromJson(Map<String, dynamic> json) => _$HotelsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelsDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Hotel {
  Analytics? analytics;
  List<dynamic>? badges;
  @JsonKey(name: 'best-offer')
  BestOffer? bestOffer;
  int? category;
  @JsonKey(name: 'category-type')
  String? categoryType;
  String? destination;
  @JsonKey(name: 'hotel-id')
  String? hotelId;
  List<ImageUrl>? images;
  double? latitude;
  double? longitude;
  String? name;
  @JsonKey(name: 'rating-info')
  RatingInfo? ratingInfo;

  Hotel({
    this.analytics,
    this.badges,
    this.bestOffer,
    this.category,
    this.categoryType,
    this.destination,
    this.hotelId,
    this.images,
    this.latitude,
    this.longitude,
    this.name,
    this.ratingInfo,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class Analytics {
  @JsonKey(name: 'select_item.item.0')
  Item? selectItem;

  Analytics({this.selectItem});

  factory Analytics.fromJson(Map<String, dynamic> json) => _$AnalyticsFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);
}

@JsonSerializable()
class Item {
  String? currency;
  String? itemCategory;
  String? itemCategory2;
  String? itemId;
  String? itemListName;
  String? itemName;
  String? itemRooms;
  String? price;
  String? quantity;

  Item({
    this.currency,
    this.itemCategory,
    this.itemCategory2,
    this.itemId,
    this.itemListName,
    this.itemName,
    this.itemRooms,
    this.price,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BestOffer {
  @JsonKey(name: 'original-travel-price')
  double? originalTravelPrice;
  @JsonKey(name: 'simple-price-per-person')
  double? simplePricePerPerson;
  double? total;
  @JsonKey(name: 'travel-price')
  double? travelPrice;
  List<String>? availableSpecialGroups;
  @JsonKey(name: 'flight-included')
  bool? flightIncluded;
  Rooms? rooms;
  @JsonKey(name: 'travel-date')
  TravelDate? travelDate;

  BestOffer({
    this.originalTravelPrice,
    this.simplePricePerPerson,
    this.total,
    this.travelPrice,
    this.availableSpecialGroups,
    this.flightIncluded,
    this.rooms,
    this.travelDate,
  });

  factory BestOffer.fromJson(Map<String, dynamic> json) => _$BestOfferFromJson(json);
  Map<String, dynamic> toJson() => _$BestOfferToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Rooms {
  RoomOverall? overall;
  @JsonKey(name: 'prices-and-occupancy')
  List<PricesAndOccupancy>? pricesAndOccupancy;
  List<RoomGroup>? roomGroups;

  Rooms({this.overall, this.pricesAndOccupancy, this.roomGroups});

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);
  Map<String, dynamic> toJson() => _$RoomsToJson(this);
}

@JsonSerializable()
class RoomOverall {
  // List<Attribute>? attributes;
  String? boarding;
  String? name;
  @JsonKey(name: 'adult-count')
  int? adultCount;
  List<int>? childrenAges;
  @JsonKey(name: 'children-count')
  int? childrenCount;
  int? quantity;
  bool? sameBoarding;
  bool? sameRoomGroups;

  RoomOverall({
    // this.attributes,
    this.boarding,
    this.name,
    this.adultCount,
    this.childrenAges,
    this.childrenCount,
    this.quantity,
    this.sameBoarding,
    this.sameRoomGroups,
  });

  factory RoomOverall.fromJson(Map<String, dynamic> json) => _$RoomOverallFromJson(json);
  Map<String, dynamic> toJson() => _$RoomOverallToJson(this);
}

@JsonSerializable()
class PricesAndOccupancy {
  int? adultCount;
  List<int>? childrenAges;
  int? childrenCount;
  String? groupIdentifier;
  int? simplePricePerPerson;
  int? total;

  PricesAndOccupancy({
    this.adultCount,
    this.childrenAges,
    this.childrenCount,
    this.groupIdentifier,
    this.simplePricePerPerson,
    this.total,
  });

  factory PricesAndOccupancy.fromJson(Map<String, dynamic> json) => _$PricesAndOccupancyFromJson(json);
  Map<String, dynamic> toJson() => _$PricesAndOccupancyToJson(this);
}

@JsonSerializable()
class RoomGroup {
  // List<Attribute>? attributes;
  String? boarding;
  String? name;
  String? detailedDescription;
  String? groupIdentifier;
  int? quantity;

  RoomGroup({this.boarding, this.name, this.detailedDescription, this.groupIdentifier, this.quantity});

  factory RoomGroup.fromJson(Map<String, dynamic> json) => _$RoomGroupFromJson(json);
  Map<String, dynamic> toJson() => _$RoomGroupToJson(this);
}

@JsonSerializable()
class TravelDate {
  int? days;
  String? departureDate;
  int? nights;
  String? returnDate;

  TravelDate({this.days, this.departureDate, this.nights, this.returnDate});

  factory TravelDate.fromJson(Map<String, dynamic> json) => _$TravelDateFromJson(json);
  Map<String, dynamic> toJson() => _$TravelDateToJson(this);
}

@JsonSerializable()
class RatingInfo {
  @JsonKey(name: 'recommendation-rate')
  int? recommendationRate;
  @JsonKey(name: 'reviews-count')
  int? reviewsCount;
  double? score;
  @JsonKey(name: 'score-description')
  String? scoreDescription;

  RatingInfo({this.recommendationRate, this.reviewsCount, this.score, this.scoreDescription});

  factory RatingInfo.fromJson(Map<String, dynamic> json) => _$RatingInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RatingInfoToJson(this);
}

@JsonSerializable()
class ImageUrl {
  String? large;
  String? small;

  ImageUrl({this.large, this.small});

  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
