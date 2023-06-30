import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapping/utils/firebase_instance.dart';

import '../../../../utils/extensions.dart';
import '../../data/datasource/firebase_register.dart';
import '../../data/datasource/firebase_register_impl.dart';
import '../../data/repository/register_repository_impl.dart';
import '../../domain/entities/user.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.firebaseRegisterImpl,
    required this.registerRepositoryImpl,
  }) : super(const RegisterState.initial());

  final FirebaseRegisterImpl firebaseRegisterImpl;
  final RegisterRepositoryImpl registerRepositoryImpl;

  void registerUser(User user) async {
    emit(const RegisterState.registering());
    final result = await registerRepositoryImpl.registerUser(user);
    result.fold((error) {
      emit(RegisterState.registerFailed(failure: error));
    }, (success) {
      firebaseFireStoreInstance.addUserDetails(user);
      emit(const RegisterState.registered());
    });
  }
}
