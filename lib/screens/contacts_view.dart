// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_book/utils/contants.dart';
import 'package:phone_book/widgets/custom_listview.dart';
import 'package:phone_book/widgets/icons.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
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
              IconButtons(
                screenHeight: screenHeight,
                onPressed: () {},
                icon: Icons.manage_search_rounded,
              ),
              Text(
                'Phone',
                style: TextStyle(fontSize: screenHeight / 40),
              ),
              IconButtons(
                icon: Icons.person_add_rounded,
                onPressed: () {},
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth / 8),
                topRight: Radius.circular(screenWidth / 8),
              ),
            ),
            child: ListView.separated(
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              itemBuilder: ((context, index) {
                return CustomListView(
                  screenWidth: screenWidth,
                  iconColor: Colors.white,
                  iconData: Icons.star_border,
                  iconOnTap: () {},
                );
              }),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.blueGrey[800],
                  thickness: 1.0,
                  indent: screenWidth / 15,
                  endIndent: screenWidth / 15,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


//TODO: add the stared contacts to favourites view