import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/firebase_login_impl.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../domain/entities/user/user.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
      {required this.firebaseLoginImpl, required this.loginRepositoryImpl})
      : super(const LoginState.initial());
  final FirebaseLoginImpl firebaseLoginImpl;
  final LoginRepositoryImpl loginRepositoryImpl;

  void signInUser(User user) async {
    emit(LoginState.loading(user: user));
    await loginRepositoryImpl.signInUser(user).then((value) => emit(
          const LoginState.loaded(),
        ));
  }
}
