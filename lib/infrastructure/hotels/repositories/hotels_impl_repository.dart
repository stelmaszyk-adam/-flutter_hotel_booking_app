import 'package:hotel_booking_app/domain/hotels/entities/hotel_list_entity.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotels_exception.dart';
import 'package:hotel_booking_app/domain/hotels/repositories/hotels_repository.dart';
import 'package:hotel_booking_app/infrastructure/hotels/local_sources/hotels_local_source.dart';
import 'package:hotel_booking_app/infrastructure/hotels/remote_sources/hotels_remote_source.dart';
import 'package:injectable/injectable.dart';
import 'package:result_dart/result_dart.dart';

@Injectable(as: HotelsRepository)
class HotelsImplRepository extends HotelsRepository {
  HotelsImplRepository({required this.localSource, required this.remoteSource});

  final HotelsRemoteSource remoteSource;
  final HotelsLocalSource localSource;

  @override
  Future<ResultDart<HotelListEntity, HotelsException>> getHotels() async {
    try {
      final result = await remoteSource.getHotels();
      return Success(
        HotelListEntity(
          result.hotels
                  ?.map(
                    (hotel) => HotelEntity(
                      id: hotel.hotelId ?? '',
                      name: hotel.name ?? '',
                      destination: hotel.destination ?? '',
                      days: hotel.bestOffer?.travelDate?.days ?? 0,
                      nights: hotel.bestOffer?.travelDate?.nights ?? 0,
                      boardingType: hotel.bestOffer?.rooms?.overall?.boarding ?? '',
                      roomType: hotel.bestOffer?.rooms?.overall?.name ?? '',
                      pricePerPerson: hotel.bestOffer?.simplePricePerPerson ?? 0,
                      totalPrice: hotel.bestOffer?.total ?? 0,
                      thumbnailImage: hotel.images?.first.small,
                      flightIncluded: hotel.bestOffer?.flightIncluded,
                      adultCount: hotel.bestOffer?.rooms?.overall?.adultCount,
                      childrenCount: hotel.bestOffer?.rooms?.overall?.childrenCount,
                      reviewsCount: hotel.ratingInfo?.reviewsCount ?? 0,
                      score: hotel.ratingInfo?.score ?? 0,
                      scoreDescription: hotel.ratingInfo?.scoreDescription ?? '',
                    ),
                  )
                  .toList() ??
              [],
        ),
      );
    } catch (e) {
      return Failure(UnknownHotelsException());
    }
  }

  @override
  Future<ResultDart<void, Exception>> deleteFavorHotel(String id) async {
    try {
      await localSource.deleteFavorHotel(id);

      return Success(unit);
    } catch (e) {
      // here can be more specific error
      return Failure(Exception(e));
    }
  }

  @override
  Future<ResultDart<List<String>, Exception>> getFavorHotels() async {
    try {
      final list = await localSource.getFavorHotels();

      return Success(list);
    } catch (e) {
      // here can be more specific error
      return Failure(Exception(e));
    }
  }

  @override
  Future<ResultDart<void, Exception>> setFavorHotel(String id) async {
    try {
      await localSource.setFavorHotel(id);

      return Success(unit);
    } catch (e) {
      // here can be more specific error
      return Failure(Exception(e));
    }
  }
}
