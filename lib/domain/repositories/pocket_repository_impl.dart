import 'package:pockets/data/datasources/local/pocket_realm_datasource.dart';
import 'package:pockets/data/datasources/models/pocket_item_model.dart';
import 'package:pockets/data/repositories/pocket_repository.dart';

class PocketRepositoryImpl implements PocketRepository {
  final PocketRealmDatasource pocketRealmDatasource;

  PocketRepositoryImpl(this.pocketRealmDatasource);

  @override
  Stream<List<PocketItemModel>> streamAll() {
    return pocketRealmDatasource.streamAll();
  }
}
