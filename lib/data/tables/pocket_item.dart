import 'package:pockets/data/datasources/models/pocket_item_model.dart';
import 'package:realm/realm.dart';

part 'pocket_item.g.dart';

mixin BaseRealmSchema<T> {
  T toModel();
}

@RealmModel()
class _PocketItem with BaseRealmSchema<PocketItemModel> implements PocketItemModel {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  @override
  late String? pocketName;

  @override
  late String? emoji;
  
  @override
  PocketItemModel toModel() {
    return PocketItemModel(pocketName, emoji);
  }

 
}
