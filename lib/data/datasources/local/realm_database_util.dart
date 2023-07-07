import 'package:realm/realm.dart';

class RealmDatabaseUtils {
  late User _currentUser;

//Set Realm User
  set currentUser(User user) => _currentUser = user;

//Open Realm
  Realm createRealm(List<SchemaObject> schemaObjects) {
    return Realm(Configuration.flexibleSync(_currentUser, schemaObjects));
  }
}
