import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockets/common/injector_config.dart';
import 'package:pockets/common/realm_wrapper.dart';
import 'package:pockets/common/routes.dart';
import 'package:pockets/presentation/journey/login/bloc/login_bloc.dart';

Future<void> main() async {
  Injector.setup();
  const appId = 'pocket-list-dzyks';
  Injector.resolve!<RealmWrapper>().initApp(appId);

  //Open Realm Sync
  // final realm = Realm(Configuration.flexibleSync(user, [PocketItem.schema]));
  // realm.subscriptions.update((mutableSubscription) {
  //   mutableSubscription.add(realm.all<PocketItem>());
  // });
  // realm.subscriptions.waitForSynchronization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = Injector.resolve!<LoginBloc>();
  }

  void _onPress() {
    Navigator.pushNamed(context, PocketRouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Realm Pocket List Applications',
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _onPress,
            tooltip: 'Login',
            child: const Text('Login'),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
