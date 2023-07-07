import 'package:pockets/domain/entity/pocket_item_entity.dart';

abstract class PocketRepository{
  Stream<List<PocketItemEntity>> streamAll();
}