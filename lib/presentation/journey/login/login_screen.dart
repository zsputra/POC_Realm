import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockets/common/injector_config.dart';
import 'package:pockets/common/routes.dart';
import 'package:pockets/presentation/journey/login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = Injector.resolve!<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: BlocListener<LoginBloc, LoginState>(
        bloc: Injector.resolve!<LoginBloc>(),
        listener: (context, state) {
          if (state is LoginSucceed) {
            Navigator.pushNamed(
              context,
              PocketRouteNames.pocketList,
            );
          } else if (state is LoginFailed) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(label: Text('Email')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(label: Text('Password')),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: TextButton(
                    child: const Text('Login'),
                    onPressed: () {
                      _loginBloc.add(StartLogin(
                          email: _emailController.text,
                          password: _passwordController.text));
                    }))
          ],
        ),
      ),
    );
  }
}
