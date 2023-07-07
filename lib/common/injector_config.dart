import 'package:kiwi/kiwi.dart';
import 'package:pockets/common/realm_wrapper.dart';
import 'package:pockets/data/datasources/local/pocket_realm_datasource.dart';
import 'package:pockets/data/datasources/local/realm_database_util.dart';
import 'package:pockets/data/repositories/pocket_repository.dart';
import 'package:pockets/domain/repositories/pocket_repository_impl.dart';
import 'package:pockets/domain/usecases/pocket_usecases.dart';
import 'package:pockets/presentation/journey/login/bloc/login_bloc.dart';
import 'package:pockets/presentation/journey/pocket_list/bloc/pocket_list_bloc.dart';

part 'injector_config.g.dart';

abstract class Injector {
  static KiwiContainer? container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  // For use from classes trying to get top-level
  // dependencies such as ChangeNotifiers or BLoCs
  static final resolve = container?.resolve;

  // ignore: unused_element
  void _configure() {
    _configureBloc();
    _configureFactory();
  }

  @Register.singleton(RealmDatabaseUtils)
  @Register.singleton(RealmWrapper)
  @Register.singleton(PocketListBloc)
  @Register.singleton(LoginBloc)
  void _configureBloc();

  @Register.factory(PocketRealmDatasource)
  @Register.factory(PocketRepository, from: PocketRepositoryImpl)
  @Register.factory(PocketUsecase)
  void _configureFactory();
}
