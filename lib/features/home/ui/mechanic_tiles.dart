import 'package:flutter/material.dart';

class MechanicTile extends StatelessWidget {
  final String name;
  final String number;
  final String address;
  const MechanicTile({super.key, required this.name, required this.number, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(-4, 4), blurRadius: 5)
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2),
        color: Colors.white,
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
                border: Border.all(width: 2),
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
