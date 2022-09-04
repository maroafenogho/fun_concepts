import 'package:bootcamp101/app/modules/auth/providers/auth_state.dart';
import 'package:bootcamp101/app/modules/auth/providers/auth_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
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
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text('Name'),
            ),
          ),
          SizedBox(height: 20),
          Consumer(builder: (((context, ref, child) {
            final state = ref.watch(authNotifierProvider);
            switch (state.status) {
              case AuthStatus.initial:
                return ElevatedButton(
                  onPressed: () {
                    ref.read(authNotifierProvider.notifier).signUp(
                        nameController.text,
                        emailController.text,
                        passwordController.text);
                  },
                  child: Text('CREATE ACCOUNT'),
                );

              case AuthStatus.loading:
                return ElevatedButton(
                  onPressed: () {},
                  child: CircularProgressIndicator(),
                );

              case AuthStatus.success:
                return Text('ACCOUNT CREATED');

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
