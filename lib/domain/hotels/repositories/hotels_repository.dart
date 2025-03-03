import 'package:hotel_booking_app/domain/hotels/entities/hotel_list_entity.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotels_exception.dart';
import 'package:result_dart/result_dart.dart';

abstract class HotelsRepository {
  Future<ResultDart<HotelListEntity, HotelsException>> getHotels();
  Future<ResultDart<void, Exception>> setFavorHotel(String id);
  Future<ResultDart<void, Exception>> deleteFavorHotel(String id);
  Future<ResultDart<List<String>, Exception>> getFavorHotels();
}
