import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/config/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
