import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapping/features/login/presentation/cubit/login_cubit.dart';

import 'features/login/presentation/view/login_view.dart';

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LoginCubit(),
        child: const HomeView(),
      ),
    );
  }
}
