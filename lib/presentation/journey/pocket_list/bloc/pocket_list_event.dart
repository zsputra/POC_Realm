part of 'pocket_list_bloc.dart';

@immutable
abstract class PocketListEvent {}

class LoadPocketListEvent extends PocketListEvent {
}

class CreatePocketEvent extends PocketListEvent {
  final PocketItem newPocket;

  CreatePocketEvent(this.newPocket);
}
