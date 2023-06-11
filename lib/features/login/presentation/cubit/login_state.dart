part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading({required User user}) = _Loading;
  const factory LoginState.loaded() = _Loaded;
}
