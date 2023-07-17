import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/features/register/domain/usecases/user_registration_impl.dart';
import 'package:mapping/utils/extensions.dart';
import 'package:mapping/utils/firebase_instance.dart';

part 'register_bloc.freezed.dart';
part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._userRegistrationImpl)
      : super(const RegisterState.initial()) {
    on<RegisterUser>((event, emit) async {
      emit(const RegisterState.registering());
      try {
        await _userRegistrationImpl.call(event.userRegInfo);
        await fbAuth.signInWithEmailAndPassword(
          email: event.userRegInfo.email,
          password: event.userRegInfo.password,
        );
        await fbFireStore.addUserRegDetails(
          event.userRegInfo,
        );
        emit(RegisterState.registered(userRegInfo: event.userRegInfo));
      } on FirebaseAuthException catch (err) {
        emit(RegisterState.registerFailed(failureMessage: err.message!));
      } on Object catch (err) {
        emit(RegisterState.registerFailed(failureMessage: err.toString()));
      }
    });
  }

  final UserRegistrationImpl _userRegistrationImpl;
}
