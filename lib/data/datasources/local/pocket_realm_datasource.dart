import 'package:pockets/data/datasources/local/base_realm_datasource.dart';
import 'package:pockets/data/datasources/local/realm_database_util.dart';
import 'package:pockets/data/datasources/models/pocket_item_model.dart';
import 'package:pockets/data/tables/pocket_item.dart';

class PocketRealmDatasource
    extends BaseRealmDatasource<PocketItem, PocketItemModel> {
  String queryAllName = 'streamAll';
  PocketRealmDatasource(
    RealmDatabaseUtils utils,
  ) : super(schemaObjects: [PocketItem.schema], utils: utils);

  Stream<List<PocketItemModel>> streamAll() async* {
    if (realm.subscriptions.findByName(queryAllName) == null) {
      await subscribeRealm(realm.all<PocketItem>(), name: queryAllName);
    }
    yield* realm.all<PocketItem>().changes.map(
        (event) => event.results.map((result) => result.toModel()).toList());
  }
}
