part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading({required String email}) = _Loading;

  const factory HomeState.loadingFailed() = _LoadingFailed;

  const factory HomeState.loaded({required UserRegInfo user}) = _Loaded;
}
