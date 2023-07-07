part of 'pocket_list_bloc.dart';

@immutable
abstract class PocketListState {}

class PocketListInitial extends PocketListState {}

class PocketListLoaded extends PocketListState {
  final List<PocketItemEntity> pockets;

  PocketListLoaded(this.pockets);
}

class CreatePocketInProgress extends PocketListState {}
