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
import 'package:mapping/config/app_router.dart' as _i10;
import 'package:mapping/config/error_handler.dart' as _i3;
import 'package:mapping/features/home/presentation/bloc/home_bloc.dart' as _i6;
import 'package:mapping/features/login/data/datasource/firebase_login_impl.dart'
    as _i4;
import 'package:mapping/features/login/data/repository/login_repository_impl.dart'
    as _i7;
import 'package:mapping/features/login/domain/usecases/user_sign_in_impl.dart'
    as _i11;
import 'package:mapping/features/login/presentation/bloc/login_bloc.dart'
    as _i12;
import 'package:mapping/features/register/data/datasource/firebase_register_impl.dart'
    as _i5;
import 'package:mapping/features/register/data/repository/register_repository_impl.dart'
    as _i8;
import 'package:mapping/features/register/domain/usecases/user_registration_impl.dart'
    as _i9;
import 'package:mapping/features/register/presentation/bloc/register_bloc.dart'
    as _i13;

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
    gh.singleton<_i3.ErrorHandler>(_i3.ErrorHandler());
    gh.factory<_i4.FirebaseLoginImpl>(() => _i4.FirebaseLoginImpl());
    gh.factory<_i5.FirebaseRegisterImpl>(() => _i5.FirebaseRegisterImpl());
    gh.factory<_i6.HomeBloc>(() => _i6.HomeBloc());
    gh.singleton<_i7.LoginRepositoryImpl>(
        _i7.LoginRepositoryImpl(gh<_i4.FirebaseLoginImpl>()));
    gh.singleton<_i8.RegisterRepositoryImpl>(
        _i8.RegisterRepositoryImpl(gh<_i5.FirebaseRegisterImpl>()));
    gh.factory<_i9.UserRegistrationImpl>(() => _i9.UserRegistrationImpl(
        registerRepositoryImpl: gh<_i8.RegisterRepositoryImpl>()));
    gh.factory<_i10.UserSignInChecker>(() => _i10.UserSignInChecker());
    gh.factory<_i11.UserSignInImpl>(() => _i11.UserSignInImpl(
        loginRepositoryImpl: gh<_i7.LoginRepositoryImpl>()));
    gh.singleton<_i10.AppRouter>(_i10.AppRouter(gh<_i10.UserSignInChecker>()));
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc(gh<_i11.UserSignInImpl>()));
    gh.factory<_i13.RegisterBloc>(
        () => _i13.RegisterBloc(gh<_i9.UserRegistrationImpl>()));
    return this;
  }
}
