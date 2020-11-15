import 'package:flutter/material.dart';

class HorizontalTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        dividerTheme: DividerThemeData(
          color: Colors.orange,
          indent: 20,
          endIndent: 20,
          thickness: 2,
          space: 30,
        ),
      );
}
