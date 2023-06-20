import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/router/router.dart';
import 'core/constants/device_sizes/device.dart';
import 'features/login/presentation/cubit/login_cubit.dart';
import 'service_locator.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    Device().init(context);

    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
