import 'package:flutter/material.dart';

class MechanicTile extends StatelessWidget {
  final String name;
  final String number;
  final String address;
  const MechanicTile({super.key, required this.name, required this.number, required this.address});

  @override
  Widget build(BuildContext context) {

    final theme=Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2,color: theme.colorScheme.tertiary),
        color: theme.colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: theme.colorScheme.tertiary),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Text(number),
              Text(address),
            ],
          )
        ],
      ),
    );
  }
}
