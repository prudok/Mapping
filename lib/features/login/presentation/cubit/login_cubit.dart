import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/utils/firebase_instance.dart';

import '../../data/datasource/firebase_login.dart';
import '../../domain/entities/user/login_user.dart';
import '../../domain/usecases/user_sign_in_impl.dart';

part 'login_cubit.freezed.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final UserSignInImpl _userSignInImpl;
  late StreamSubscription<User?> _userSub;

  LoginCubit(this._userSignInImpl) : super(const LoginState.initial()) {
    _userSub = fbAuth.authStateChanges().listen((User? user) {
      user == null ? const LoginState.logOut() : LoginState.logIn(user: user);
    });
  }

  @override
  Future<void> close() async {
    await _userSub.cancel();
    return super.close();
  }

  void signInUser(LoginUser user) async {
    emit(const LoginState.loading());
    final result = await _userSignInImpl.call(user);
    result.fold((error) {
      emit(LoginState.loadFailed(error));
    }, (success) {
      emit(LoginState.logIn(user: success));
    });
  }
}
