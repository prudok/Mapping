import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasource/firebase_login.dart';
import '../../domain/entities/user/login_user.dart';
import '../../domain/usecases/user_sign_in_impl.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserSignInImpl userSignInImpl;

  LoginCubit({required this.userSignInImpl})
      : super(const LoginState.initial());

  void signInUser(LoginUser user) async {
    emit(const LoginState.loading());
    final result = await userSignInImpl.call(user);
    result.fold((error) {
      emit(LoginState.loadFailed(error));
    }, (success) {
      emit(LoginState.loaded(loginUser: user));
    });
  }
}
