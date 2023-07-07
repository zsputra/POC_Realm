import 'dart:async';

import 'package:pockets/common/injector_config.dart';
import 'package:pockets/data/datasources/local/realm_database_util.dart';
import 'package:realm/realm.dart';

class RealmWrapper {
  final Completer<App> _appCompleter = Completer<App>();

  //Init App Realm
  void initApp(appId) {
    if (!_appCompleter.isCompleted) {
      _appCompleter.complete(App(AppConfiguration(appId)));
    }
  }

  //Login
  Future<void> loginRealm(String jwtToken,
      {bool shouldSwitchUser = true}) async {
    final app = await _appCompleter.future;
    final user = shouldSwitchUser
        ? await app.logIn(Credentials.jwt(jwtToken))
        : app.currentUser ?? await app.logIn(Credentials.jwt(jwtToken));
    Injector.resolve!<RealmDatabaseUtils>().currentUser = user;
  }
}
