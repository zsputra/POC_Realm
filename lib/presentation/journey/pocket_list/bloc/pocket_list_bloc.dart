import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pockets/data/tables/pocket_item.dart';
import 'package:pockets/domain/entity/pocket_item_entity.dart';
import 'package:pockets/domain/usecases/pocket_usecases.dart';

part 'pocket_list_event.dart';
part 'pocket_list_state.dart';

class PocketListBloc extends Bloc<PocketListEvent, PocketListState> {
  final PocketUsecase pocketUsecase;
  PocketListBloc(this.pocketUsecase) : super(PocketListInitial()) {
    on<LoadPocketListEvent>((event, emit) async {
      await _mapLoadPocketListEventToState(event, emit);
    });
    on<CreatePocketEvent>(
        (event, emit) => _mapCreatePocketEventToState(event, emit));
  }

  Future<void> _mapLoadPocketListEventToState(
      LoadPocketListEvent event, Emitter<PocketListState> emit) async {
 
    await emit.forEach(pocketUsecase.streamAll(), onData: (data) {
      return PocketListLoaded(data);
    });
  }

  Future<void> _mapCreatePocketEventToState(
      CreatePocketEvent event, Emitter<PocketListState> emit) async {
    // event.pocketRealm.write(() => event.pocketRealm.add(event.newPocket));
    // emit(CreatePocketInProgress());
  }
}
