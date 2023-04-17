// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phone_book/database/db_handler.dart';
import 'package:phone_book/screens/add_contact.dart';
import 'package:phone_book/screens/contact_details.dart';
import 'package:phone_book/userType/contact.dart';
import 'package:phone_book/utils/contants.dart';
import 'package:phone_book/widgets/custom_listview.dart';
import 'package:phone_book/widgets/icons.dart';

var isEditingModeOn = false;

class ContactsPage extends StatefulWidget {
  const ContactsPage({
    super.key,
  });

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contactList = [];

  @override
  void initState() {
    getAllContacts();
    super.initState();
  }

  Future<void> addContactData(Contact contact) async {
    await DbHandler.instance.insert(contact);
    initState();
  }

  Future<void> updateContactdata(Contact contact) async {
    await DbHandler.instance.update(contact);
    initState();
  }

  Future<void> deleteContactdata(String id) async {
    await DbHandler.instance.delete(id);
    initState();
  }

  //get contacts to display
  Future<void> getAllContacts() async {
    List<Contact> contacts = await DbHandler.instance.getAllContacts();

    setState(() {
      contactList = contacts;
    });
  }

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
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddContact(
                        addContactData: addContactData,
                      ),
                    ),
                  );
                },
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
            child: contactList.isEmpty
                ? Center(
                    child: Text(
                      'No Contacts Found!',
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: contactList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      Contact contact = contactList[index];
                      return CustomListView(
                        screenWidth: screenWidth,
                        iconColor: Colors.white,
                        iconData: Icons.star_border,
                        onItemClicked: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactDetails(
                                //this is for contact details page
                                contact: contact),
                          ),
                        ),
                        //this is for custom listView page
                        contact: contact,
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