import 'package:get_it/get_it.dart';

import 'features/login/data/datasource/firebase_login_impl.dart';
import 'features/login/data/repository/login_repository_impl.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'features/register/data/datasource/firebase_register_impl.dart';
import 'features/register/data/repository/register_repository_impl.dart';
import 'features/register/presentation/cubit/register_cubit.dart';
import 'utils/cubits/user_auth_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setup() async {
  // Cubits
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      firebaseLoginImpl: sl(),
      loginRepositoryImpl: sl(),
    ),
  );
  sl.registerFactory<RegisterCubit>(
    () => RegisterCubit(
      firebaseRegisterImpl: sl(),
      registerRepositoryImpl: sl(),
    ),
  );
  sl.registerFactory<UserAuthCubit>(() => UserAuthCubit());

  // Firebase Data sources
  sl.registerFactory<FirebaseLoginImpl>(() => FirebaseLoginImpl());
  sl.registerFactory<FirebaseRegisterImpl>(() => FirebaseRegisterImpl());

  // Repositories
  sl.registerFactory<LoginRepositoryImpl>(
    () => LoginRepositoryImpl(sl()),
  );
  sl.registerFactory<RegisterRepositoryImpl>(
    () => RegisterRepositoryImpl(sl()),
  );
}
