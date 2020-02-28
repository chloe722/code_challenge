import 'package:coding_challenge/models/contact.dart';
import 'package:coding_challenge/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatefulWidget {
  ContactItem({this.contact});

  final Contact contact;

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(contact: widget.contact))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(widget.contact.name),
          ],
        ),
      ),
    );
  }
}
