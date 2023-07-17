import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/login/domain/entities/login_user.dart';
import 'package:mapping/features/login/domain/usecases/user_sign_in_impl.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._userSignInImpl) : super(const LoginState.initial()) {
    on<SignIn>((event, emit) async {
      emit(const LoginState.loading());
      try {
        final result = await _userSignInImpl.call(event.user);
        emit(LoginState.logIn(user: result));
      } on FirebaseAuthException catch (err) {
        emit(LoginState.loadFailed(err.message!));
      } on Object catch (err) {
        emit(LoginState.loadFailed(err.toString()));
      }
    });
  }

  final UserSignInImpl _userSignInImpl;
}
