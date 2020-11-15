import 'package:flutter/material.dart';

class VerticalTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        dividerTheme: DividerThemeData(
          color: Colors.black87,
          indent: 10,
          endIndent: 10,
          thickness: 0.3,
          space: 10,
        ),
      );
}
