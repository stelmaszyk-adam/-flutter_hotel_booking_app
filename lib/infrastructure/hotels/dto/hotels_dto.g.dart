// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelsDto _$HotelsDtoFromJson(Map<String, dynamic> json) => HotelsDto(
  hotels:
      (json['hotels'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HotelsDtoToJson(HotelsDto instance) => <String, dynamic>{
  'hotels': instance.hotels?.map((e) => e.toJson()).toList(),
};

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
  analytics:
      json['analytics'] == null
          ? null
          : Analytics.fromJson(json['analytics'] as Map<String, dynamic>),
  badges: json['badges'] as List<dynamic>?,
  bestOffer:
      json['best-offer'] == null
          ? null
          : BestOffer.fromJson(json['best-offer'] as Map<String, dynamic>),
  category: (json['category'] as num?)?.toInt(),
  categoryType: json['category-type'] as String?,
  destination: json['destination'] as String?,
  hotelId: json['hotel-id'] as String?,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  name: json['name'] as String?,
  ratingInfo:
      json['rating-info'] == null
          ? null
          : RatingInfo.fromJson(json['rating-info'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
  'analytics': instance.analytics?.toJson(),
  'badges': instance.badges,
  'best-offer': instance.bestOffer?.toJson(),
  'category': instance.category,
  'category-type': instance.categoryType,
  'destination': instance.destination,
  'hotel-id': instance.hotelId,
  'images': instance.images?.map((e) => e.toJson()).toList(),
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'name': instance.name,
  'rating-info': instance.ratingInfo?.toJson(),
};

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) => Analytics(
  selectItem:
      json['select_item.item.0'] == null
          ? null
          : Item.fromJson(json['select_item.item.0'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AnalyticsToJson(Analytics instance) => <String, dynamic>{
  'select_item.item.0': instance.selectItem,
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  currency: json['currency'] as String?,
  itemCategory: json['itemCategory'] as String?,
  itemCategory2: json['itemCategory2'] as String?,
  itemId: json['itemId'] as String?,
  itemListName: json['itemListName'] as String?,
  itemName: json['itemName'] as String?,
  itemRooms: json['itemRooms'] as String?,
  price: json['price'] as String?,
  quantity: json['quantity'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'currency': instance.currency,
  'itemCategory': instance.itemCategory,
  'itemCategory2': instance.itemCategory2,
  'itemId': instance.itemId,
  'itemListName': instance.itemListName,
  'itemName': instance.itemName,
  'itemRooms': instance.itemRooms,
  'price': instance.price,
  'quantity': instance.quantity,
};

BestOffer _$BestOfferFromJson(Map<String, dynamic> json) => BestOffer(
  originalTravelPrice: (json['original-travel-price'] as num?)?.toDouble(),
  simplePricePerPerson: (json['simple-price-per-person'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toDouble(),
  travelPrice: (json['travel-price'] as num?)?.toDouble(),
  availableSpecialGroups:
      (json['availableSpecialGroups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
  flightIncluded: json['flight-included'] as bool?,
  rooms:
      json['rooms'] == null
          ? null
          : Rooms.fromJson(json['rooms'] as Map<String, dynamic>),
  travelDate:
      json['travel-date'] == null
          ? null
          : TravelDate.fromJson(json['travel-date'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BestOfferToJson(BestOffer instance) => <String, dynamic>{
  'original-travel-price': instance.originalTravelPrice,
  'simple-price-per-person': instance.simplePricePerPerson,
  'total': instance.total,
  'travel-price': instance.travelPrice,
  'availableSpecialGroups': instance.availableSpecialGroups,
  'flight-included': instance.flightIncluded,
  'rooms': instance.rooms?.toJson(),
  'travel-date': instance.travelDate?.toJson(),
};

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
  overall:
      json['overall'] == null
          ? null
          : RoomOverall.fromJson(json['overall'] as Map<String, dynamic>),
  pricesAndOccupancy:
      (json['prices-and-occupancy'] as List<dynamic>?)
          ?.map((e) => PricesAndOccupancy.fromJson(e as Map<String, dynamic>))
          .toList(),
  roomGroups:
      (json['roomGroups'] as List<dynamic>?)
          ?.map((e) => RoomGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
  'overall': instance.overall?.toJson(),
  'prices-and-occupancy':
      instance.pricesAndOccupancy?.map((e) => e.toJson()).toList(),
  'roomGroups': instance.roomGroups?.map((e) => e.toJson()).toList(),
};

RoomOverall _$RoomOverallFromJson(Map<String, dynamic> json) => RoomOverall(
  boarding: json['boarding'] as String?,
  name: json['name'] as String?,
  adultCount: (json['adult-count'] as num?)?.toInt(),
  childrenAges:
      (json['childrenAges'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  childrenCount: (json['children-count'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  sameBoarding: json['sameBoarding'] as bool?,
  sameRoomGroups: json['sameRoomGroups'] as bool?,
);

Map<String, dynamic> _$RoomOverallToJson(RoomOverall instance) =>
    <String, dynamic>{
      'boarding': instance.boarding,
      'name': instance.name,
      'adult-count': instance.adultCount,
      'childrenAges': instance.childrenAges,
      'children-count': instance.childrenCount,
      'quantity': instance.quantity,
      'sameBoarding': instance.sameBoarding,
      'sameRoomGroups': instance.sameRoomGroups,
    };

PricesAndOccupancy _$PricesAndOccupancyFromJson(Map<String, dynamic> json) =>
    PricesAndOccupancy(
      adultCount: (json['adultCount'] as num?)?.toInt(),
      childrenAges:
          (json['childrenAges'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      childrenCount: (json['childrenCount'] as num?)?.toInt(),
      groupIdentifier: json['groupIdentifier'] as String?,
      simplePricePerPerson: (json['simplePricePerPerson'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PricesAndOccupancyToJson(PricesAndOccupancy instance) =>
    <String, dynamic>{
      'adultCount': instance.adultCount,
      'childrenAges': instance.childrenAges,
      'childrenCount': instance.childrenCount,
      'groupIdentifier': instance.groupIdentifier,
      'simplePricePerPerson': instance.simplePricePerPerson,
      'total': instance.total,
    };

RoomGroup _$RoomGroupFromJson(Map<String, dynamic> json) => RoomGroup(
  boarding: json['boarding'] as String?,
  name: json['name'] as String?,
  detailedDescription: json['detailedDescription'] as String?,
  groupIdentifier: json['groupIdentifier'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoomGroupToJson(RoomGroup instance) => <String, dynamic>{
  'boarding': instance.boarding,
  'name': instance.name,
  'detailedDescription': instance.detailedDescription,
  'groupIdentifier': instance.groupIdentifier,
  'quantity': instance.quantity,
};

TravelDate _$TravelDateFromJson(Map<String, dynamic> json) => TravelDate(
  days: (json['days'] as num?)?.toInt(),
  departureDate: json['departureDate'] as String?,
  nights: (json['nights'] as num?)?.toInt(),
  returnDate: json['returnDate'] as String?,
);

Map<String, dynamic> _$TravelDateToJson(TravelDate instance) =>
    <String, dynamic>{
      'days': instance.days,
      'departureDate': instance.departureDate,
      'nights': instance.nights,
      'returnDate': instance.returnDate,
    };

RatingInfo _$RatingInfoFromJson(Map<String, dynamic> json) => RatingInfo(
  recommendationRate: (json['recommendation-rate'] as num?)?.toInt(),
  reviewsCount: (json['reviews-count'] as num?)?.toInt(),
  score: (json['score'] as num?)?.toDouble(),
  scoreDescription: json['score-description'] as String?,
);

Map<String, dynamic> _$RatingInfoToJson(RatingInfo instance) =>
    <String, dynamic>{
      'recommendation-rate': instance.recommendationRate,
      'reviews-count': instance.reviewsCount,
      'score': instance.score,
      'score-description': instance.scoreDescription,
    };

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) =>
    ImageUrl(large: json['large'] as String?, small: json['small'] as String?);

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) => <String, dynamic>{
  'large': instance.large,
  'small': instance.small,
};
