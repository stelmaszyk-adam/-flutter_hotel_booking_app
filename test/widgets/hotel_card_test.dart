import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

final l10n = lookupAppLocalizations(const Locale('de'));

void main() {
  Future<void> _initView(
    WidgetTester tester, {
    String? thumbnailImage,
    VoidCallback? onClickFavor,
    double? score,
    int? reviewsCount,
    String? scoreDescription,
    double? pricePerPerson,
    double? totalPrice,
    int? days,
    int? nights,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: HotelCard(
            name: 'Hotel Test',
            destination: 'Test Destination',
            buttonText: 'Book Now',
            thumbnailImage: thumbnailImage,
            onClickFavor: onClickFavor,
            score: score,
            reviewsCount: reviewsCount,
            scoreDescription: scoreDescription,
            pricePerPerson: pricePerPerson,
            totalPrice: totalPrice,
            days: days,
            nights: nights,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  group('HotelCard', () {
    testWidgets('displays name and destination', (WidgetTester tester) async {
      await _initView(tester);

      expect(find.text('Hotel Test'), findsOneWidget);
      expect(find.text('Test Destination'), findsOneWidget);
    });

    testWidgets('displays thumbnail image if provided', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await _initView(tester, thumbnailImage: 'https://example.com/image.jpg');

        expect(find.byType(Image), findsWidgets);
      });
    });

    testWidgets('displays favorite icon if onClickFavor is provided', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await _initView(tester, onClickFavor: () {}, thumbnailImage: '');

        expect(find.byIcon(Icons.favorite_border), findsOneWidget);
      });
    });

    testWidgets('displays score and reviews count if provided', (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await _initView(tester, score: 4.5, reviewsCount: 100, scoreDescription: 'Excellent', thumbnailImage: '');

        expect(find.text('Excellent (100 ${l10n.reviewsCount})'), findsOneWidget);
      });
    });

    testWidgets('displays price per person and total price if provided', (WidgetTester tester) async {
      await _initView(tester, pricePerPerson: 100.0, totalPrice: 200.0);

      expect(find.text('100.0 ${l10n.perPerson}'), findsOneWidget);
    });

    testWidgets('displays days and nights if provided', (WidgetTester tester) async {
      await _initView(tester, days: 3, nights: 2);

      expect(find.text('3 ${l10n.day}'), findsOneWidget);
      expect(find.text('2 ${l10n.nights}'), findsOneWidget);
    });
  });
}
