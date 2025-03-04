import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotel_list_entity.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotels_exception.dart';
import 'package:hotel_booking_app/domain/hotels/repositories/hotels_repository.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class MockHotelsRepository extends Mock implements HotelsRepository {}

void main() {
  late HomeCubit homeCubit;
  late MockHotelsRepository mockHotelsRepository;
  late HotelListEntity successHotelsList;
  late List<String> favorList;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    homeCubit = HomeCubit(hotelsRepository: mockHotelsRepository);
    successHotelsList = HotelListEntity([
      HotelEntity(
        id: '1',
        name: faker.company.name(),
        destination: faker.address.city(),
        days: faker.randomGenerator.integer(10, min: 1),
        nights: faker.randomGenerator.integer(10, min: 1),
        boardingType: faker.lorem.word(),
        roomType: faker.lorem.word(),
        pricePerPerson: faker.randomGenerator.decimal(min: 50, scale: 2),
        totalPrice: faker.randomGenerator.decimal(min: 100, scale: 2),
        thumbnailImage: faker.image.loremPicsum(),
        adultCount: faker.randomGenerator.integer(4, min: 1),
        childrenCount: faker.randomGenerator.integer(4, min: 0),
        flightIncluded: faker.randomGenerator.boolean(),
        reviewsCount: faker.randomGenerator.integer(1000, min: 0),
        score: faker.randomGenerator.decimal(min: 1, scale: 1),
        scoreDescription: faker.lorem.sentence(),
      ),
      HotelEntity(
        id: faker.guid.guid(),
        name: faker.company.name(),
        destination: faker.address.city(),
        days: faker.randomGenerator.integer(10, min: 1),
        nights: faker.randomGenerator.integer(10, min: 1),
        boardingType: faker.lorem.word(),
        roomType: faker.lorem.word(),
        pricePerPerson: faker.randomGenerator.decimal(min: 50, scale: 2),
        totalPrice: faker.randomGenerator.decimal(min: 100, scale: 2),
        thumbnailImage: faker.image.loremPicsum(),
        adultCount: faker.randomGenerator.integer(4, min: 1),
        childrenCount: faker.randomGenerator.integer(4, min: 0),
        flightIncluded: faker.randomGenerator.boolean(),
        reviewsCount: faker.randomGenerator.integer(1000, min: 0),
        score: faker.randomGenerator.decimal(min: 1, scale: 1),
        scoreDescription: faker.lorem.sentence(),
      ),
    ]);
    favorList = ['1'];
  });

  group('HomeCubit', () {
    test('initial state is HomeInitState', () {
      expect(homeCubit.state, const HomeInitState());
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoadingState, HomeSuccessState] when init is successful',
      build: () {
        when(() => mockHotelsRepository.getHotels()).thenAnswer((_) async => Success(successHotelsList));
        when(() => mockHotelsRepository.getFavorHotels()).thenAnswer((_) async => Success(favorList));
        return homeCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [const HomeLoadingState(), HomeSuccessState(hotels: successHotelsList, favor: favorList)],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoadingState, HomeFailureState] when init fails',
      build: () {
        when(() => mockHotelsRepository.getHotels()).thenAnswer((_) async => Failure(UnknownHotelsException()));
        return homeCubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [const HomeLoadingState(), HomeFailureState(failure: UnknownHotelsException())],
    );

    blocTest<HomeCubit, HomeState>(
      'emits updated HomeSuccessState when changeStatusOfFavor is called - run delete',
      build: () {
        when(() => mockHotelsRepository.getHotels()).thenAnswer((_) async => Success(successHotelsList));
        when(() => mockHotelsRepository.getFavorHotels()).thenAnswer((_) async => Success(['1', '2']));
        when(() => mockHotelsRepository.deleteFavorHotel('2')).thenAnswer((_) async => Success(unit));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.init();
        await cubit.changeStatusOfFavor('2');
      },
      expect: () => [
        HomeLoadingState(),
        HomeSuccessState(hotels: successHotelsList, favor: ['1', '2']),
      ],
      verify: (_) {
        verify(
          () => mockHotelsRepository.getHotels(),
        ).called(1);
        verify(
          () => mockHotelsRepository.getFavorHotels(),
        ).called(2);
        verify(
          () => mockHotelsRepository.deleteFavorHotel('2'),
        ).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits updated HomeSuccessState when changeStatusOfFavor is called - run setFavor',
      build: () {
        when(() => mockHotelsRepository.getHotels()).thenAnswer((_) async => Success(successHotelsList));
        when(() => mockHotelsRepository.getFavorHotels()).thenAnswer((_) async => Success(favorList));
        when(() => mockHotelsRepository.setFavorHotel('2')).thenAnswer((_) async => Success(unit));
        return homeCubit;
      },
      act: (cubit) async {
        await cubit.init();
        await cubit.changeStatusOfFavor('2');
      },
      expect: () => [HomeLoadingState(), HomeSuccessState(hotels: successHotelsList, favor: favorList)],
      verify: (_) {
        verify(
          () => mockHotelsRepository.getHotels(),
        ).called(1);
        verify(
          () => mockHotelsRepository.getFavorHotels(),
        ).called(2);
        verify(
          () => mockHotelsRepository.setFavorHotel('2'),
        ).called(1);
      },
    );
  });
}
