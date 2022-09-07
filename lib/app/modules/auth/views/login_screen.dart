// ignore_for_file: use_build_context_synchronously

import 'package:bootcamp101/app/modules/auth/providers/auth_state.dart';
import 'package:bootcamp101/app/modules/auth/providers/auth_state_notifier.dart';
import 'package:bootcamp101/app/modules/house/providers/house_state_notifier.dart';
import 'package:bootcamp101/app/modules/house/views/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.black.withAlpha(150),
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
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
                  height: MediaQuery.of(context).size.height * 0.09,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(authNotifierProvider.notifier).signIn(
                          emailController.text, passwordController.text);

                      if (ref.watch(authNotifierProvider.notifier).success ==
                          true) {
                        ref.read(houseNotifierProvider.notifier).getHouses();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => Homepage()),
                            (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Logged in failed')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );

              case AuthStatus.loading:
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    onPressed: () {},
                    child: CircularProgressIndicator(),
                  ),
                );

              case AuthStatus.success:
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    onPressed: () {},
                    child: CircularProgressIndicator(),
                  ),
                );
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
