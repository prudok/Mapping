import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/firebase_instance.dart';
import '../../data/datasource/firebase_register.dart';
import '../../domain/entities/user_registration_info.dart';
import '../../domain/usecases/user_registration_impl.dart';

part 'register_bloc.freezed.dart';

part 'register_event.dart';

part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegistrationImpl _userRegistrationImpl;

  RegisterBloc(this._userRegistrationImpl)
      : super(const RegisterState.initial()) {
    on<RegisterUser>((event, emit) async {
      emit(const RegisterState.registering());
      final result = await _userRegistrationImpl.call(event.userRegInfo);
      result.fold(
        (error) {
          emit(RegisterState.registerFailed(failure: error));
        },
        (success) async {
          await fbFireStore.addUserDetails(event.userRegInfo);
          fbAuth.signInWithEmailAndPassword(
            email: event.userRegInfo.email,
            password: event.userRegInfo.password,
          );
          emit(RegisterState.registered(userRegInfo: event.userRegInfo));
        },
      );
    });
  }
}
