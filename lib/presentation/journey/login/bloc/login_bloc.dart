import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pockets/common/realm_wrapper.dart';
import 'package:pockets/data/tables/__mock__/users_mock.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RealmWrapper realmWrapper;
  LoginBloc(this.realmWrapper) : super(LoginInitial()) {
    on<StartLogin>((event, emit) async {
      final foundUser = userMocks.firstWhere(
          (user) =>
              user['email'] == event.email &&
              user['password'] == event.password,
          orElse: () => {});
      if (foundUser == {} || foundUser['customerId'] == null) {
        emit(LoginFailed());
      } else {
        final token = generateToken({
          "aud": "pocket-list-dzyks",
          "sub": foundUser['email'],
          "exp": 1596288789414124,
          "customerId": foundUser['customerId'],
          "iat": 159624558912313
        });
         await realmWrapper.loginRealm(token);
         
        emit(LoginSucceed());
      }
    });
  }


  String generateToken(dynamic payload) {
    final jwt = JWT(
      payload,
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

    // Sign it
    return jwt.sign(SecretKey('asdf2342342345wer24234r2fasdfafd243'));
  }
}
