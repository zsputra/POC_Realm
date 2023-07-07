// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class PocketItem extends _PocketItem
    with RealmEntity, RealmObjectBase, RealmObject {
  PocketItem(
    ObjectId id, {
    String? pocketName,
    String? emoji,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'pocketName', pocketName);
    RealmObjectBase.set(this, 'emoji', emoji);
  }

  PocketItem._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get pocketName =>
      RealmObjectBase.get<String>(this, 'pocketName') as String?;
  @override
  set pocketName(String? value) =>
      RealmObjectBase.set(this, 'pocketName', value);

  @override
  String? get emoji => RealmObjectBase.get<String>(this, 'emoji') as String?;
  @override
  set emoji(String? value) => RealmObjectBase.set(this, 'emoji', value);

  @override
  Stream<RealmObjectChanges<PocketItem>> get changes =>
      RealmObjectBase.getChanges<PocketItem>(this);

  @override
  PocketItem freeze() => RealmObjectBase.freezeObject<PocketItem>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PocketItem._);
    return const SchemaObject(
        ObjectType.realmObject, PocketItem, 'PocketItem', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('pocketName', RealmPropertyType.string, optional: true),
      SchemaProperty('emoji', RealmPropertyType.string, optional: true),
    ]);
  }
}
