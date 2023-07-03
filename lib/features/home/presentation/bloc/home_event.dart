part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.loadUserDetails(String email) = LoadUserDetails;

  const factory HomeEvent.signOut() = SignOut;
}
