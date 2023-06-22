import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/firebase_login.dart';
import '../../data/datasource/firebase_login_impl.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../domain/entities/user/user.dart';

part 'login_cubit.freezed.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.firebaseLoginImpl,
    required this.loginRepositoryImpl,
  }) : super(const LoginState.initial());

  final FirebaseLoginImpl firebaseLoginImpl;
  final LoginRepositoryImpl loginRepositoryImpl;

  void signInUser(User user) async {
    emit(LoginState.loading(user: user));
    final result = await loginRepositoryImpl.signInUser(user);
    result.fold((error) {
      emit(LoginState.loadFailed(error));
    }, (success) {
      emit(const LoginState.loaded());
    });
  }
}
