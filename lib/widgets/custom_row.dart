// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  CustomRow({
    super.key,
    required this.width,
    required this.backgroundColor,
    required this.iconData, required this.text,
  });

  final double width;
  final Color backgroundColor;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: width / 8,
            width: width / 8,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Icon(iconData),
          ),
          SizedBox(
            width: width / 20,
          ),
          SizedBox(
            height: width / 6,
            child: VerticalDivider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.7,
            ),
          ),
          SizedBox(
            width: width / 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: width / 20),
          )
        ],
      ),
    );
  }
}
