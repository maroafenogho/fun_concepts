import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);

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
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/rental.jpg'))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: Text(
            'Well vetted accomodations.\nNo tricks',
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
