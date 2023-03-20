// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_book/utils/contants.dart';
import 'package:phone_book/widgets/custom_row.dart';
import 'package:phone_book/widgets/icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
            vertical: screenWidth / 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth / 8,
              ),
              Text(
                'Profile',
                style: TextStyle(fontSize: screenHeight / 40),
              ),
              IconButtons(
                screenHeight: screenHeight,
                onPressed: () {},
                icon: Icons.edit,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.only(
              top: screenWidth / 10,
              left: screenWidth / 10,
              right: screenWidth / 10,
            ),
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth / 8),
                topRight: Radius.circular(screenWidth / 8),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: screenWidth / 2.5,
                  height: screenWidth / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      //TODO: add the user profile picture
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenWidth / 10,
                ),
                Text(
                  'Rahul Rasve',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth / 10,
                  ),
                ),
                SizedBox(
                  height: screenWidth / 10,
                ),
                CustomRow(
                  width: screenWidth,
                  backgroundColor: Colors.green,
                  iconData: Icons.call,
                  text: '8551013348',
                ),
                SizedBox(
                  height: screenWidth / 15,
                ),
                CustomRow(
                  width: screenWidth,
                  backgroundColor: Colors.grey.shade800,
                  iconData: Icons.mail,
                  text: 'rahul@gmail.com',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
