import 'package:bootcamp101/app/modules/auth/providers/auth_state.dart';
import 'package:bootcamp101/app/modules/auth/providers/auth_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../weather/screens/weather_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          // TextFormField(
          //   controller: nameController,
          //   keyboardType: TextInputType.name,
          //   decoration: InputDecoration(
          //     label: Text('Name'),
          //   ),
          // ),
          SizedBox(height: 20),
          Consumer(builder: (((context, ref, child) {
            final state = ref.watch(authNotifierProvider);
            switch (state.status) {
              case AuthStatus.initial:
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(authNotifierProvider.notifier).signIn(
                          emailController.text, passwordController.text);

                      if (ref.watch(authNotifierProvider.notifier).success ==
                          true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Yay')));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => WeatherHome()),
                            (route) => false);
                      }
                    },
                    child: Text('LOGIN'),
                  ),
                );

              case AuthStatus.loading:
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    onPressed: () {},
                    child: CircularProgressIndicator(),
                  ),
                );

              case AuthStatus.success:
                return InkWell(
                    onTap: () {
                      ref.read(authNotifierProvider.notifier).reset();
                    },
                    child: Text('LOGIN SUCCESSFUL'));

              case AuthStatus.failed:
                return InkWell(
                    onTap: () {
                      ref.read(authNotifierProvider.notifier).reset();
                    },
                    child: Text('ERROR\ntry again'));
            }
          }))),
        ],
      ),
    )));
  }
}
