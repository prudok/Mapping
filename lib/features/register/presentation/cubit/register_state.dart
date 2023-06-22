part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.registering() = _Registering;
  const factory RegisterState.registered() = _Registered;
}
