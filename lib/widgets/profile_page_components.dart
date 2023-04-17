// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.screenWidth,
    required this.onTap,
    this.selectedImageFile,
  });

  final double screenWidth;
  final File? selectedImageFile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth / 2.5,
        height: screenWidth / 2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: selectedImageFile != null
                ? FileImage(selectedImageFile!)
                : AssetImage('assets/alt_person.png') as ImageProvider,
            fit: BoxFit.cover,
          ),
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
