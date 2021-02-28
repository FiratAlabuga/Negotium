import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function onChange;
  SearchBar({@required this.controller, @required this.onChange});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _searchFocus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_searchFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: TextField(
            controller: widget.controller,
            focusNode: _searchFocus,
            onTap: _requestFocus,
            onChanged: (value) {
              widget.onChange(value);
            },
            decoration: InputDecoration(
              labelText: "Ara",
              labelStyle: TextStyle(
                  color: _searchFocus.hasFocus
                      ? Theme.of(context).accentColor
                      : Colors.grey),
              hintText: "Burada her şeyi arayabilirsiniz!",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search,
                  color: _searchFocus.hasFocus
                      ? Theme.of(context).accentColor
                      : Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
          )),
    );
  }
}
