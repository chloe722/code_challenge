import 'package:coding_challenge/screens/all_contacts_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AllContactsScreen());
  }
}

//abstract class HomeAbstract<T> extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GroupedListView<T, dynamic>(
//      elements: getContactList<>(),
//      groupBy: (contact) => contact.group,
//      shrinkWrap: true,
//      itemBuilder: (context, element) => Item(
//        name: element.name,
//      ),
//      groupSeparatorBuilder: (val) => GroupSeparator(label: val),
//    );
//  }
//}
