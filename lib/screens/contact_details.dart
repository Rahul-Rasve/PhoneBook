// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/screens/contacts_view.dart';
import 'package:phone_book/userType/contact.dart';
import 'package:phone_book/utils/contants.dart';
import 'package:phone_book/widgets/custom_row.dart';
import 'package:phone_book/widgets/icons.dart';
import 'package:phone_book/widgets/profile_page_components.dart';

class ContactDetails extends StatefulWidget {
  final Contact contact;
  final Future<void> Function(Contact contact)? updateContactdata;
  final Future<void> Function(String id)? deleteContactData;

  const ContactDetails({
    super.key,
    required this.contact,
    this.updateContactdata,
    this.deleteContactData,
  });

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  File? imageFile;
  String? imagePath;
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.contact.name;
    _mobileController.text = widget.contact.mobile;
    _emailController.text = widget.contact.email;
  }

  Future<void> pickImage() async {
    if (isEditingModeOn) {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
          imagePath = pickedFile.path;
        });
      } else {
        Fluttertoast.showToast(
          msg: 'No Image selected!',
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } else {
      return;
    }
  }

  void updateContact() async {}
  void deleteContact() async {}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: screenWidth / 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButtons(
                    screenHeight: screenHeight,
                    onPressed: () {
                      isEditingModeOn = false;
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios_new_rounded,
                  ),
                  SizedBox(
                    width: screenWidth / 8,
                  ),
                  IconButtons(
                    screenHeight: screenHeight,
                    onPressed: () {
                      setState(() {
                        isEditingModeOn = true;
                      });
                    },
                    icon: isEditingModeOn ? Icons.save : Icons.edit,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: profilePadding(screenWidth),
                decoration: profileBoxDecoration(screenWidth),
                child: Column(
                  children: [
                    ProfileImage(
                      screenWidth: screenWidth,
                      onTap: () => pickImage(),
                      selectedImageFile: File(widget.contact.photoUrl),
                    ),
                    SizedBox(
                      height: screenWidth / 10,
                    ),
                    !isEditingModeOn
                        ? Text(
                            widget.contact.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth / 15,
                            ),
                          )
                        : TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Name',
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                    SizedBox(
                      height: screenWidth / 10,
                    ),
                    CustomRow(
                      width: screenWidth,
                      backgroundColor: Colors.green,
                      iconData: Icons.call,
                      customWidget: !isEditingModeOn
                          ? Text(
                              widget.contact.mobile,
                              style: TextStyle(
                                fontSize: screenWidth / 20,
                              ),
                            )
                          : TextField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: 'Mobile',
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                    ),
                    SizedBox(
                      height: screenWidth / 10,
                    ),
                    CustomRow(
                      width: screenWidth,
                      backgroundColor: Colors.grey.shade800,
                      iconData: Icons.mail_rounded,
                      customWidget: !isEditingModeOn
                          ? Text(
                              widget.contact.email,
                              style: TextStyle(
                                fontSize: screenWidth / 20,
                              ),
                            )
                          : TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                    ),
                    SizedBox(
                      height: screenWidth / 5,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[900]),
                        fixedSize: MaterialStateProperty.all(
                          Size(screenWidth, screenHeight / 15),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth / 20,
                            ),
                          ),
                        ),
                      ),
                      child: Text(
                        'Delete Contact',
                        style: TextStyle(
                          fontSize: screenWidth / 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
