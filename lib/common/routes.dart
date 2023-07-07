import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockets/common/injector_config.dart';
import 'package:pockets/presentation/journey/login/login_screen.dart';
import 'package:pockets/presentation/journey/pocket_list/bloc/pocket_list_bloc.dart';
import 'package:pockets/presentation/journey/pocket_list/pocket_list_screen.dart';

abstract class PocketRouteNames {
  static String pocketList = '/pocket_list';
  static String createPocket = '/create_pocket';
  static String login = '/login';
}

Map<String, Widget Function(BuildContext)> routes = {
  PocketRouteNames.pocketList: (context) {
    return BlocProvider<PocketListBloc>(
      create: (context) => Injector.resolve!<PocketListBloc>(),
      child: const PocketListScreen(),
    );
  },
  PocketRouteNames.login: (context) {
    return BlocProvider<PocketListBloc>(
      create: (context) => Injector.resolve!<PocketListBloc>(),
      child: const LoginScreen(),
    );
  }
};
