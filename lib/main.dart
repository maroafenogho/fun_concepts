import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter riverpod',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ).copyWith(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(),
    );
  }
}

final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Consumer(builder: (context, ref, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You have touched the button ${ref.watch(counterProvider.state).state} times'),
            SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  ref.read(counterProvider.state).state = 0;
                },
                child: Text('reset'))
          ],
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++,
        child: Icon(Icons.add),
      ),
    );
  }
}
