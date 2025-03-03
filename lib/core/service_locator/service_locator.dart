import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hotel_booking_app/core/service_locator/service_locator.config.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(asExtension: true, initializerName: 'init')
Future<GetIt> configInjector() async {
  await Hive.initFlutter();
  return getIt.init();
}
