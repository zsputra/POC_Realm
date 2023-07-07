import 'package:pockets/common/injector_config.dart';
import 'package:pockets/data/datasources/local/realm_database_util.dart';
import 'package:realm/realm.dart';

abstract class BaseRealmDatasource<RealmModelType extends RealmObject,
    ModelType> {
  late RealmDatabaseUtils utils;
  final List<SchemaObject> schemaObjects;
  late Realm _realm;
  BaseRealmDatasource({required this.utils, required this.schemaObjects}) {
    _realm = utils.createRealm(schemaObjects);
    utils = Injector.resolve!<RealmDatabaseUtils>();
  }

  Realm get realm => _realm;

  //Subsribe Realm
  subscribeRealm(
    RealmResults<RealmModelType> query, {
    String? name,
    bool update = false,
  }) async {
    _realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(query);
    });
    await _realm.subscriptions.waitForSynchronization();
  }

  //Get by Field Name
  RealmModelType getByField(String fieldName, dynamic value) {
    String queryEquals = '$fieldName ==';
    String valueString = r'$0';
    final result =
        _realm.query<RealmModelType>('$queryEquals$valueString', [value]);
    return result.first;
  }
}
