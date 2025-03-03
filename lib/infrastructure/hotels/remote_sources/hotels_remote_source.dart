import 'package:dio/dio.dart';
import 'package:hotel_booking_app/infrastructure/hotels/dto/hotels_dto.dart';
import 'package:injectable/injectable.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';

part 'hotels_remote_source.g.dart';

@RestApi()
@Injectable()
abstract class HotelsRemoteSource {
  @factoryMethod
  factory HotelsRemoteSource(Dio dio, {@Named('baseUrl') String? baseUrl}) = _HotelsRemoteSource;

  @GET('/hotels.json')
  Future<HotelsDto> getHotels();
}
