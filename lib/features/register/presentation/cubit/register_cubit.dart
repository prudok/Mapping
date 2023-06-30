import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/firebase_instance.dart';
import '../../data/datasource/firebase_register.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/user_registration.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRegistration userRegistration;

  RegisterCubit({required this.userRegistration})
      : super(const RegisterState.initial());

  void registerUser(User user) async {
    emit(const RegisterState.registering());
    final result = await userRegistration.call(user);
    result.fold((error) {
      emit(RegisterState.registerFailed(failure: error));
    }, (success) {
      firebaseFireStoreInstance.addUserDetails(user);
      emit(const RegisterState.registered());
    });
  }
}
