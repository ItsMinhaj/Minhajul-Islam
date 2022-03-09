import 'package:flutter/material.dart';

import '../theme/themes.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .07,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: bgColor,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: const [
              SizedBox(width: 16.0),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Icon(Icons.search),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search product you wish...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
