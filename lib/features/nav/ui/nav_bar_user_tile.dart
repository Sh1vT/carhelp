import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {

    final theme=Theme.of(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          border: Border(
            top: BorderSide(width: 2,color: theme.colorScheme.tertiary),
            right: BorderSide(width: 2,color: theme.colorScheme.tertiary),
            bottom: BorderSide(width: 2,color: theme.colorScheme.tertiary),
          ),
          color: theme.colorScheme.secondary,
        ),
        margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: Image(
                height: 90,
                width: 90,
                image: NetworkImage('https://i.ibb.co/FnSxqF1/rosamund.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Samarth',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('+919721105076',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
