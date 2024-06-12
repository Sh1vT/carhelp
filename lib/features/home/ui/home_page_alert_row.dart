import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageAlertRow extends StatelessWidget {
  String fieldName = "";
  String fieldValue = "";
  HomePageAlertRow(
      {super.key, required this.fieldName, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Text(fieldName, style: const TextStyle(fontWeight: FontWeight.w500),),
            const Spacer(),
            Text(fieldValue, style: const TextStyle(fontSize: 14),),
          ],
        ),
        Container(
          color: theme.colorScheme.tertiary,
          height: 1,
        ),
        const SizedBox(
          height: 2,
        )
      ],
    );
  }
}
