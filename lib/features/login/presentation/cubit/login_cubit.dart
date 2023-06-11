import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasource/firebase_login_impl.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../domain/entities/user/user.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());
  final loginRepositoryImpl = LoginRepositoryImpl(FirebaseLoginImpl());

  void signInUser(User user) async {
    emit(LoginState.loading(user: user));
    await loginRepositoryImpl.signInUser(user).then((value) => emit(
          const LoginState.loaded(),
        ));
  }
}
