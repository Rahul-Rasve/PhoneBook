// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phone_book/userType/contact.dart';

class ContactDetails extends StatefulWidget {
  final Contact? contact;
  const ContactDetails(
    Contact selectedContact, {
    super.key,
    this.contact,
  });

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Name : ${widget.contact!.name}'),
            Text('Mobile : ${widget.contact!.mobile}'),
            Text('Email : ${widget.contact!.email}'),
          ],
        ),
      ),
    );
  }
}
