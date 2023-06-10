import 'package:flutter/material.dart';

import 'features/login/presentation/view/login_view.dart';

void main() {
  runApp(const Mapping());
}

class Mapping extends StatelessWidget {
  const Mapping({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
