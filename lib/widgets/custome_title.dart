import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';

class CustomTitleName extends StatelessWidget {
  const CustomTitleName({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
