import 'package:flutter/material.dart';

class PopUpSnackbar extends SnackBar {
  final String snackContent;

  PopUpSnackbar({super.key, required this.snackContent})
      : super(
          content: Text(
            snackContent,
          ),
        );
}
