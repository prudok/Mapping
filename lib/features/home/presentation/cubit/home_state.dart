part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  // TODO: implement the User entity
  const factory HomeState.loaded({required UserRegInfo user}) = _Loaded;
}
