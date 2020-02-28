import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final Function(String) onSearch;

  SearchView({this.onSearch});

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: new InputDecoration(hintText: 'Search'),
        onChanged: (val) => widget.onSearch(val),
      ),
    );
  }
}
