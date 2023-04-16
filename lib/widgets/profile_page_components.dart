// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.screenWidth,
    required this.imageUrl,
  });

  final double screenWidth;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 2.5,
      height: screenWidth / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          //TODO: add the user profile picture
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ParentNameText extends StatelessWidget {
  const ParentNameText({
    super.key,
    required TextEditingController nameController,
    required this.screenWidth,
  }) : _nameController = nameController;

  final TextEditingController _nameController;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Text(
      _nameController.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: screenWidth / 15,
      ),
    );
  }
}
