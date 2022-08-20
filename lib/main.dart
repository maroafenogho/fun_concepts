import 'package:bootcamp101/app/modules/weather/screens/weather_screen.dart';
import 'package:bootcamp101/app/modules/weather/services/api_client.dart';
import 'package:bootcamp101/clock_state_notifier.dart';
// import 'package:bootcamp101/modules/app/weather/services/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockProvider);
    final formattedTime = DateFormat.Hms().format(currentTime);
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('The time is:'),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => WeatherHome()));
                  // ApiClient.getWeather();
                },
                child: Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}
