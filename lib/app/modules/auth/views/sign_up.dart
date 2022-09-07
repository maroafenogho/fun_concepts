import 'package:bootcamp101/app/modules/auth/providers/auth_state.dart';
import 'package:bootcamp101/app/modules/auth/providers/auth_state_notifier.dart';
import 'package:bootcamp101/app/modules/auth/views/login_screen.dart';
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Sign-Up',
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
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text('Name'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Consumer(builder: (((context, ref, child) {
              final state = ref.watch(authNotifierProvider);
              switch (state.status) {
                case AuthStatus.initial:
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: ElevatedButton(
                        onPressed: () async {
                          await ref.read(authNotifierProvider.notifier).signUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text);
                          if (ref
                                  .watch(authNotifierProvider.notifier)
                                  .accountCreated ==
                              true) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Account created successfully')));
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()),
                                (route) => false);
                            ;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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

                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return LoginScreen();
                        })));
                      },
                      child: Text('ACCOUNT CREATED\nGo to Login Page'));

                case AuthStatus.failed:
                  return InkWell(
                      onTap: () {
                        ref.read(authNotifierProvider.notifier).reset();
                      },
                      child: Text('ERROR\ntry again'));
              }
            }))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.008,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withAlpha(150),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return LoginScreen();
                        }),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
