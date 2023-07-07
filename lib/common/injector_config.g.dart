// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureBloc() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => RealmDatabaseUtils())
      ..registerSingleton((c) => RealmWrapper())
      ..registerSingleton((c) => PocketListBloc(c<PocketUsecase>()))
      ..registerSingleton((c) => LoginBloc(c<RealmWrapper>()));
  }

  @override
  void _configureFactory() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => PocketRealmDatasource(c<RealmDatabaseUtils>()))
      ..registerFactory<PocketRepository>(
          (c) => PocketRepositoryImpl(c<PocketRealmDatasource>()))
      ..registerFactory((c) => PocketUsecase(c<PocketRepository>()));
  }
}
