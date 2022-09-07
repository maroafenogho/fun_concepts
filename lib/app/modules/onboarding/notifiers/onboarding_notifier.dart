import 'package:bootcamp101/app/modules/onboarding/views/widgets/screen_2.dart';
import 'package:bootcamp101/app/modules/onboarding/views/widgets/screen_3.dart';
import 'package:bootcamp101/app/modules/onboarding/views/widgets/screen_one.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider((ref) => 0);
final widgetsProvider = StateProvider(
    (ref) => [OnboardingScreen1(), OnboardingScreen2(), OnboardingScreen3()]);
