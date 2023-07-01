import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/extensions.dart';
import '../../../../utils/firebase_instance.dart';
import '../../data/datasource/firebase_register.dart';
import '../../domain/entities/user_registration_info.dart';
import '../../domain/usecases/user_registration_impl.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final UserRegistrationImpl userRegistrationImpl;

  RegisterCubit({required this.userRegistrationImpl})
      : super(const RegisterState.initial());

  void registerUser(UserRegInfo user) async {
    emit(const RegisterState.registering());
    final result = await userRegistrationImpl.call(user);
    result.fold((error) {
      emit(RegisterState.registerFailed(failure: error));
    }, (success) {
      fbFireStore.addUserDetails(user);
      emit(const RegisterState.registered());
    });
  }
}
