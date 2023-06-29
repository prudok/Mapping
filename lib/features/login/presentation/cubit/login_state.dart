part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loadFailed(LoginFailure loginFailure) = _loadFailed;
  const factory LoginState.loaded() = _Loaded;
}
