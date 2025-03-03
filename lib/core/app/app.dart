import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/core/router/router.dart';
import 'package:hotel_booking_app/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = AppRouter();
    return MaterialApp.router(
      theme: AppTheme.hotelAppTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
