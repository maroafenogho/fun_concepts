import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          // padding: const EdgeInsets.symmetric(vertical: 30.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              // color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/living_room_1.jpg'))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: Text(
            'Get comfortable housing at ease.\nZero hassle',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withAlpha(150),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
