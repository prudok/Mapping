import 'package:flutter/material.dart';
import 'package:mapping/core/constants/colors/app_colors.dart';
import 'package:mapping/core/constants/device_size/device.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Device().init(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: Device.height! * 0.4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.map, size: 80, color: AppColors.purple),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isNotEmpty ||
                        _passwordController.text.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("ok")),
                      );
                    }
                  },
                  child: const Text('Log In'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered Yet?'),
                    TextButton(onPressed: () {}, child: const Text('Register'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
