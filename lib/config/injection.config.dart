// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/home/presentation/bloc/home_bloc.dart' as _i6;
import '../features/login/data/datasource/firebase_login_impl.dart' as _i4;
import '../features/login/data/repository/login_repository_impl.dart' as _i7;
import '../features/login/domain/usecases/user_sign_in_impl.dart' as _i10;
import '../features/login/presentation/bloc/login_bloc.dart' as _i11;
import '../features/register/data/datasource/firebase_register_impl.dart'
    as _i5;
import '../features/register/data/repository/register_repository_impl.dart'
    as _i8;
import '../features/register/domain/usecases/user_registration_impl.dart'
    as _i9;
import '../features/register/presentation/bloc/register_bloc.dart' as _i12;
import 'app_router.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.factory<_i4.FirebaseLoginImpl>(() => _i4.FirebaseLoginImpl());
    gh.factory<_i5.FirebaseRegisterImpl>(() => _i5.FirebaseRegisterImpl());
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.singleton<_i7.LoginRepositoryImpl>(
        _i7.LoginRepositoryImpl(gh<_i4.FirebaseLoginImpl>()));
    gh.singleton<_i8.RegisterRepositoryImpl>(
        _i8.RegisterRepositoryImpl(gh<_i5.FirebaseRegisterImpl>()));
    gh.factory<_i9.UserRegistrationImpl>(() => _i9.UserRegistrationImpl(
        registerRepositoryImpl: gh<_i8.RegisterRepositoryImpl>()));
    gh.factory<_i10.UserSignInImpl>(() => _i10.UserSignInImpl(
        loginRepositoryImpl: gh<_i7.LoginRepositoryImpl>()));
    gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(gh<_i10.UserSignInImpl>()));
    gh.factory<_i12.RegisterBloc>(
        () => _i12.RegisterBloc(gh<_i9.UserRegistrationImpl>()));
    return this;
  }
}
