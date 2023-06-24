import 'package:get_it/get_it.dart';

import 'features/login/data/datasource/firebase_login_impl.dart';
import 'features/login/data/repository/login_repository_impl.dart';
import 'features/login/presentation/cubit/login_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // Cubits
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      firebaseLoginImpl: sl(),
      loginRepositoryImpl: sl(),
    ),
  );
  // sl.registerFactory<RegisterCubit>(sl());

  // Firebase Datasources
  sl.registerFactory<FirebaseLoginImpl>(() => FirebaseLoginImpl());

  // Repotitories
  sl.registerFactory<LoginRepositoryImpl>(
    () => LoginRepositoryImpl(sl()),
  );
}
