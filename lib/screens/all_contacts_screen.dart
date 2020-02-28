import 'package:coding_challenge/data.dart';
import 'package:coding_challenge/models/contact.dart';
import 'package:coding_challenge/widgets/contact_item.dart';
import 'package:coding_challenge/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class AllContactsScreen extends StatefulWidget {
  @override
  _AllContactsScreenState createState() => _AllContactsScreenState();
}

class _AllContactsScreenState extends State<AllContactsScreen> {
  ScrollController _controller;
  double height;
  GlobalKey _key = GlobalKey();
  bool searchActivated = false;
  List<Contact> _contacts;

  @override
  void initState() {
    _controller = ScrollController();
    _contacts = getContactList();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _moveUp() {
    _controller.animateTo(_controller.offset - height,
        curve: Curves.linear, duration: Duration(milliseconds: 50));
  }

  void _moveDown() {
    _controller.animateTo(_controller.offset + height,
        curve: Curves.linear, duration: Duration(milliseconds: 50));
  }

  void _getSizes() {
    final RenderBox renderBoxRed = _key.currentContext.findRenderObject();
    height = renderBoxRed.size.height;
  }

  void _afterLayout(_) {
    _getSizes();
  }

  void onSearch(String val) {
    setState(() {
      _contacts = getContactList()
          .where((contact) => contact.name.contains(val))
          .toList();
    });
  }

  void _searchActivated({bool activated}) {
    setState(() {
      searchActivated = activated;
    });
  }

  void _scrollToNine() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: searchActivated
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _searchActivated(activated: false))
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _searchActivated(activated: true)),
          title: searchActivated
              ? SearchView(
                  onSearch: onSearch,
                )
              : Container(
                  child: null,
                ),
        ),
        body: Column(
          children: <Widget>[
            if (searchActivated == false)
              ButtonGroupBar(
                  moveUp: _moveUp,
                  moveDown: _moveDown,
                  scrollToNine: _scrollToNine),
            Expanded(
              child: GroupedListView<Contact, dynamic>(
                controller: _controller,
                key: _key,
                elements: _contacts,
                groupBy: (contact) => contact.group,
                shrinkWrap: true,
                itemBuilder: (context, element) => ContactItem(
                  contact: element,
                ),
                groupSeparatorBuilder: (val) => GroupSeparator(label: val),
              ),
            ),
          ],
        ));
  }
}

class GroupSeparator extends StatelessWidget {
  GroupSeparator({this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      color: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ButtonGroupBar extends StatelessWidget {
  ButtonGroupBar({this.moveUp, this.moveDown, this.scrollToNine});


   Function moveUp;
  final Function moveDown;
  final Function scrollToNine;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_upward),
            onPressed: () => moveUp(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: () => moveDown(),
          ),
          RaisedButton(
            child: Text("9th"),
            onPressed: () => scrollToNine(),
          )
        ],
      ),
    );
  }
}
