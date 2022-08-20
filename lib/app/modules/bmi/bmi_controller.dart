import 'package:get/state_manager.dart';
import 'dart:math';

class BmiController extends GetxController {
  final selectedCard = ''.obs;
  final height = 180.obs;
  final weight = 60.obs;
  final age = 17.obs;
  final bmi = ''.obs;
  final bmiResult = ''.obs;

  increaseWeight() {
    weight.value++;
  }

  String calculateBmi(int height, weight) {
    double theBmi = weight / pow(height / 100, 2);
    bmi.value = theBmi.toStringAsFixed(1);
    String returnStatement = '';
    if (theBmi < 18.5) {
      returnStatement =
          'Your BMI is lower than it should be.\nTry putting on some weight.';
    } else if (theBmi < 24.9) {
      returnStatement = 'Your BMI is looking great.';
    } else if (theBmi >= 25) {
      returnStatement =
          'Your BMI is higher than it should be.\nTry shedding on some weight.';
    }
    return returnStatement;
  }

  increaseAge() {
    age.value++;
  }

  reduceAge() {
    if (age.value > 0) {
      age.value--;
    }
  }

  reduceWeight() {
    if (weight.value > 0) {
      weight.value--;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
