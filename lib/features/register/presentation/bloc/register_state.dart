part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.registering() = _Registering;

  const factory RegisterState.registered() = _Registered;

  const factory RegisterState.registerFailed({
    required RegisterFailure failure,
  }) = _RegisterFailed;
}
