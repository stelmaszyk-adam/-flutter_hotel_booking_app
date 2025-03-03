import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotel_list_entity.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotels_exception.dart';
import 'package:hotel_booking_app/domain/hotels/repositories/hotels_repository.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.hotelsRepository}) : super(const HomeInitState());

  HotelsRepository hotelsRepository;

  Future<void> init() async {
    emit(const HomeLoadingState());
    final result = await hotelsRepository.getHotels();

    await result.fold(
      (data) async {
        final favorHotels = (await hotelsRepository.getFavorHotels()).getOrNull() ?? [];

        emit(HomeSuccessState(hotels: data, favor: favorHotels));
      },
      (failure) {
        emit(HomeFailureState(failure: failure));
      },
    );
  }

  Future<void> changeStatusOfFavor(String id) async {
    if (state case HomeSuccessState oldState) {
      switch (oldState.favor.contains(id)) {
        case false:
          await hotelsRepository.setFavorHotel(id);
        case true:
          await hotelsRepository.deleteFavorHotel(id);
      }

      final favorHotels = (await hotelsRepository.getFavorHotels()).getOrNull() ?? [];

      emit(HomeSuccessState(hotels: oldState.hotels, favor: favorHotels));
    }
  }
}
