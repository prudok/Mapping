part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = _Loading;

  const factory LoginState.loadFailed(LoginFailure loginFailure) = _LoadFailed;

  const factory LoginState.logIn({required User user}) = _LogIn;

  const factory LoginState.logOut() = _LogOut;
}
