import 'package:bootcamp101/common/app_constants.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(children: [
          Icon(
            icon,
            size: 80.0,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            text,
            style: AppConstants.kLabelTextStyle,
          )
        ]),
      ),
    );
  }
}
