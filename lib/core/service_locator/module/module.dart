import 'package:dio/dio.dart';
import 'package:hotel_booking_app/core/const/constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServiceModule {
  @Named('baseUrl')
  String get baseUrl => Const.baseUrl;

  Dio provideDio() => Dio();
}
