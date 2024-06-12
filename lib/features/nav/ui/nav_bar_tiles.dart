import 'package:flutter/material.dart';

class NavBarTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final String settings;
  const NavBarTile({super.key, required this.name, required this.icon, required this.settings});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(settings);
      },
      child: Container(
        height: 40,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  size: 14,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      name,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 1,
              color: Colors.grey[700],
            )
          ],
        ),
      ),
    );
  }
}
