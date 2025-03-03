import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';

abstract class AppTheme {
  // static final theme = ThemeData(
  //   useMaterial3: true,
  //   fontFamily: 'Poppins-Regular',
  //   colorScheme: const ColorScheme.light(),
  //   scaffoldBackgroundColor: AppColors.white,
  //   // navigationBarTheme: NavigationBarThemeData(
  //   //   height: 56,
  //   //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  //   //   labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
  //   //   // backgroundColor: AppColors.darkBlue,
  //   //   indicatorColor: AppColors.grey,
  //   //   iconTheme: WidgetStatePropertyAll(IconThemeData(color: AppColors.grey)),
  //   // ),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     // selectedIconTheme: IconThemeData(color: AppColors.grey),
  //     selectedItemColor: AppColors.grey,
  //     unselectedItemColor: AppColors.grey,
  //     selectedLabelStyle: TextStyle(color: AppColors.grey),
  //     unselectedLabelStyle: TextStyle(color: AppColors.grey),
  //     showUnselectedLabels: true,
  //     showSelectedLabels: true,
  //     type: BottomNavigationBarType.fixed,
  //   ),
  //   textButtonTheme: TextButtonThemeData(
  //     // style: ButtonStyle(
  //     //   foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
  //     //     if (states.contains(WidgetState.disabled)) {
  //     //       return AppColors.white.withOpacity(0.3);
  //     //     }
  //     //     return AppColors.white;
  //     //   }),
  //     //   splashFactory: NoSplash.splashFactory,
  //     //   textStyle: const WidgetStatePropertyAll(AppFonts.button1),
  //     //   padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
  //     //   backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
  //     //     if (states.contains(WidgetState.disabled)) {
  //     //       return AppColors.grey.dark;
  //     //     } else if (states.contains(WidgetState.pressed)) {
  //     //       return AppColors.orange.normalActive;
  //     //     }
  //     //     return AppColors.orange.normal;
  //     //   }),
  //     // ),
  //   ),
  //   primaryColor: AppColors.primary,
  //   appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBlue, titleTextStyle: TextStyle(color: AppColors.darkBlue)),
  // );

  static final ThemeData hotelAppTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.grey,
      unselectedItemColor: AppColors.grey,
      selectedLabelStyle: TextStyle(color: AppColors.grey),
      unselectedLabelStyle: TextStyle(color: AppColors.grey),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, height: 22 / 18),
      labelLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 24 / 20),
      labelMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, height: 22 / 16),
      labelSmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, height: 20 / 14),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 16 / 12),
    ),

    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), color: AppColors.white),
  );
}
