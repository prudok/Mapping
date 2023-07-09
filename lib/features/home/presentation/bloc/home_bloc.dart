import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/utils/extensions.dart';
import 'package:mapping/utils/firebase_instance.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<LoadUserDetails>(
      (event, emit) async {
        emit(HomeState.loading(email: event.email));
        try {
          await fbFireStore
              .getUserDetails(event.email)
              .then((userDetails) => emit(HomeState.loaded(user: userDetails)));
        } catch (_) {
          emit(const HomeState.loadingFailed());
        }
      },
    );

    on<SignOut>((event, emit) async {
      await fbAuth.signOut();
    });
  }
}
