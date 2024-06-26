import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {

  String username = '';
  String phone = '';

  Future<void> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('name') ?? '';
    phone = prefs.getString('phone') ?? '';
    setState(() {}); // Update UI with fetched data, since this is done once, a simple setstate will do
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

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
        child: (username=="")?const Center(child: CircularProgressIndicator()):Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ClipOval(
              child: Image(
                height: 90,
                width: 90,
                image: NetworkImage('https://i.ibb.co/FnSxqF1/rosamund.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(phone,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}