import 'package:flutter/material.dart';

class BasicTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        dividerTheme: DividerThemeData(
          color: Colors.red,
          space: 80,
          indent: 10,
          endIndent: 10,
          thickness: 1.2,
        ),
      );
}
