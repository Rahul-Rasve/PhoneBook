// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_book/utils/contants.dart';
import 'package:phone_book/widgets/custom_listview.dart';
import 'package:phone_book/widgets/icons.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
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
                'Favourites',
                style: TextStyle(fontSize: screenHeight / 40),
              ),
              SizedBox(
                width: screenWidth / 8,
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
              itemBuilder: ((context, index) {
                return CustomListView(
                  screenWidth: screenWidth,
                  iconData: Icons.star,
                  iconColor: Colors.red,
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
