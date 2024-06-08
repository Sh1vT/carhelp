import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(-4, 4), blurRadius: 5)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          border: Border(
            top: BorderSide(width: 2),
            right: BorderSide(width: 2),
            bottom: BorderSide(width: 2),
          ),
          color: Colors.white,
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
