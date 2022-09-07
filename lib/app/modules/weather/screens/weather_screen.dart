import 'package:bootcamp101/app/modules/weather/notifiers/weather_state.dart';
import 'package:bootcamp101/app/modules/weather/notifiers/weather_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeatherHome extends HookConsumerWidget {
  const WeatherHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Consumer(builder: ((context, ref, child) {
        // ref.read(weatherNotifierProvider.notifier).getWeather();
        final state = ref.watch(weatherNotifierProvider);

        switch (state.status) {
          case WeatherStatus.initial:
            return Center(
              child: SizedBox(
                child: Column(
                  children: [
                    Text('No weather'),
                    InkWell(
                        onTap: () {
                          ref
                              .read(weatherNotifierProvider.notifier)
                              .getWeather();
                        },
                        child: Text('Get Weather')),
                  ],
                ),
              ),
            );
          case WeatherStatus.loading:
            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            );
          case WeatherStatus.success:
            return Center(
              child: SizedBox(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(weatherNotifierProvider.notifier).getWeather();
                      },
                      child: Text('Reload'),
                    ),
                    Text(state.weathers[0].locationName),
                    Text(state.weathers[0].description),
                    Text(state.weathers[0].temp.toStringAsFixed(1)),
                  ],
                ),
              ),
            );
          case WeatherStatus.failure:
            return Center(
              child: Column(
                children: [
                  Text('Error'),
                  InkWell(
                      onTap: () {
                        ref.read(weatherNotifierProvider.notifier).getWeather();
                      },
                      child: Text('Get Weather')),
                ],
              ),
            );
        }
      })),
    );
  }
}
