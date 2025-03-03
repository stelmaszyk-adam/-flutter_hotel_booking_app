import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotel_list_entity.dart';
import 'package:hotel_booking_app/domain/hotels/entities/hotels_exception.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';
import 'package:hotel_booking_app/screens/overview/view/overview_tab.dart';
import 'package:hotel_booking_app/screens/overview/widgets/overview_container.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';

import '../../../widgets/hotel_card_test.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  late HomeCubit homeCubit;

  setUp(() {
    homeCubit = MockHomeCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<HomeCubit>(create: (_) => homeCubit, child: const OverviewTab()),
    );
  }

  group('OverviewTab', () {
    testWidgets('shows CircularProgressIndicator when state is HomeInitState or HomeLoadingState', (tester) async {
      when(() => homeCubit.state).thenReturn(HomeInitState());

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      when(() => homeCubit.state).thenReturn(HomeLoadingState());
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows error message and try again button when state is HomeFailureState', (tester) async {
      when(() => homeCubit.state).thenReturn(HomeFailureState(failure: UnknownHotelsException()));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text(l10n.errorText), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('shows OverviewContainer when state is HomeSuccessState', (tester) async {
      when(() => homeCubit.state).thenReturn(HomeSuccessState(hotels: HotelListEntity([]), favor: []));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(OverviewContainer), findsOneWidget);
    });
  });
}
