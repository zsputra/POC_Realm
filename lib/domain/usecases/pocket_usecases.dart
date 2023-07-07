import 'package:pockets/data/repositories/pocket_repository.dart';
import 'package:pockets/domain/entity/pocket_item_entity.dart';

class PocketUsecase {
  final PocketRepository pocketRepository;

  PocketUsecase(this.pocketRepository);

  Stream<List<PocketItemEntity>> streamAll() => pocketRepository.streamAll();
}
