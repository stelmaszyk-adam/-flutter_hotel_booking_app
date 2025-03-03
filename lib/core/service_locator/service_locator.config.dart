// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hotel_booking_app/core/service_locator/module/module.dart'
    as _i39;
import 'package:hotel_booking_app/domain/hotels/repositories/hotels_repository.dart'
    as _i750;
import 'package:hotel_booking_app/infrastructure/hotels/local_sources/hotels_local_source.dart'
    as _i713;
import 'package:hotel_booking_app/infrastructure/hotels/remote_sources/hotels_remote_source.dart'
    as _i210;
import 'package:hotel_booking_app/infrastructure/hotels/repositories/hotels_impl_repository.dart'
    as _i649;
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart' as _i152;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceModule = _$ServiceModule();
    gh.factory<_i361.Dio>(() => serviceModule.provideDio());
    gh.factory<_i713.HotelsLocalSource>(() => _i713.HotelsLocalSource());
    gh.factory<String>(() => serviceModule.baseUrl, instanceName: 'baseUrl');
    gh.factory<_i210.HotelsRemoteSource>(
      () => _i210.HotelsRemoteSource(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.factory<_i750.HotelsRepository>(
      () => _i649.HotelsImplRepository(
        localSource: gh<_i713.HotelsLocalSource>(),
        remoteSource: gh<_i210.HotelsRemoteSource>(),
      ),
    );
    gh.factory<_i152.HomeCubit>(
      () => _i152.HomeCubit(hotelsRepository: gh<_i750.HotelsRepository>()),
    );
    return this;
  }
}

class _$ServiceModule extends _i39.ServiceModule {}
