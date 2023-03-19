// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_book/utils/routes.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.screenWidth,
    required this.iconData, required this.iconColor,
  });

  final double screenWidth;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, contactDetails),
      contentPadding: EdgeInsets.symmetric(
        vertical: screenWidth / 18,
        horizontal: screenWidth / 10,
      ),
      leading: SizedBox(
        height: screenWidth / 7,
        width: screenWidth / 7,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Align(
        alignment: Alignment(-0.5, 0),
        child: Text(
          'Rahul Rasve',
          style: TextStyle(
            fontSize: screenWidth / 22,
          ),
        ),
      ),
      trailing: IconButton(
        tooltip: 'add contacts to favorite',
        onPressed: () {},
        icon: Icon(
          iconData,
          color: iconColor,
        ),
      ),
    );
  }
}
