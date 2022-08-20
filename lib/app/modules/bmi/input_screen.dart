import 'package:bootcamp101/app/modules/bmi/bmi_controller.dart';
import 'package:bootcamp101/common/app_constants.dart';
import 'package:bootcamp101/common/app_widgets/gender_button.dart';
import 'package:bootcamp101/common/app_widgets/reusable_card.dart';
import 'package:bootcamp101/common/app_widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BmiInputScreen extends StatelessWidget {
  BmiInputScreen({Key? key}) : super(key: key);
  final controller = Get.put(BmiController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('BMI Calculator'),
          backgroundColor: AppConstants.backgroundColor,
          elevation: 0,
        ),
        body: Container(
          color: AppConstants.backgroundColor,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => GenderCard(
                              icon: FontAwesomeIcons.mars,
                              text: 'MALE',
                              color: controller.selectedCard.value == 'male'
                                  ? AppConstants.activeCardColor
                                  : AppConstants.mainColor,
                              onTap: () {
                                controller.selectedCard.value = 'male';
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => GenderCard(
                              icon: FontAwesomeIcons.venus,
                              text: 'FEMALE',
                              color: controller.selectedCard.value == 'female'
                                  ? AppConstants.activeCardColor
                                  : AppConstants.mainColor,
                              onTap: () {
                                controller.selectedCard.value = 'female';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppConstants.activeCardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: AppConstants.kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Obx(
                                () => Text(
                                  controller.height.value.toString(),
                                  style: AppConstants.numberTextStyle,
                                ),
                              ),
                              Text(
                                'cm',
                                style: AppConstants.kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Color(0xFFEB1555),
                              activeTrackColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                              inactiveTrackColor: Color(0x25f5f5f5),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Obx(
                              () => Slider(
                                value: controller.height.value.toDouble(),
                                min: 120,
                                max: 220,
                                onChanged: (double newValue) {
                                  controller.height.value = newValue.round();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            colour: AppConstants.activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'WEIGHT',
                                  style: AppConstants.kLabelTextStyle,
                                ),
                                Obx(
                                  () => Text(
                                    controller.weight.value.toString(),
                                    style: AppConstants.numberTextStyle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        controller.reduceWeight();
                                      },
                                    ),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        controller.increaseWeight();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReusableCard(
                            colour: AppConstants.activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'AGE',
                                  style: AppConstants.kLabelTextStyle,
                                ),
                                Obx(
                                  () => Text(
                                    controller.age.value.toString(),
                                    style: AppConstants.numberTextStyle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        controller.reduceAge();
                                      },
                                    ),
                                    SizedBox(
                                      width: 16.0,
                                    ),
                                    RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        controller.increaseAge();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      String text = controller.calculateBmi(
                          controller.height.value, controller.weight.value);
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Text(
                                    controller.bmi.value,
                                    style: double.parse(controller.bmi.value) <
                                            18.5
                                        ? AppConstants.numberTextStyleRed
                                        : double.parse(controller.bmi.value) <
                                                24.9
                                            ? AppConstants.numberTextStyleGreen
                                            : AppConstants.numberTextStyleRed,
                                  ),
                                  Text(
                                    text,
                                    style: AppConstants.kLabelTextStyle2,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              backgroundColor: AppConstants.activeCardColor,
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEB1555),
                    ),
                    child: Text('CALCULATE', style: AppConstants.bigTextStyle)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
