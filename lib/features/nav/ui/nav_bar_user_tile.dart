import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:shared_preferences/shared_preferences.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key});

=======
import 'package:provider/provider.dart';
import 'package:carhelp/features/user_model.dart'; // Import UserModel

class UserTile extends StatelessWidget {
>>>>>>> Stashed changes
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
    final theme = Theme.of(context);

    return Consumer<UserModel>(
      builder: (context, userModel, child) {
        if (userModel.username.isEmpty) {
          // If user data is not loaded yet, load it
          userModel.loadUserData();
          return const Center(child: CircularProgressIndicator());
        }

<<<<<<< Updated upstream
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
=======
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
>>>>>>> Stashed changes
              ),
              border: Border(
                top: BorderSide(width: 2, color: theme.colorScheme.tertiary),
                right: BorderSide(width: 2, color: theme.colorScheme.tertiary),
                bottom: BorderSide(width: 2, color: theme.colorScheme.tertiary),
              ),
              color: theme.colorScheme.secondary,
            ),
<<<<<<< Updated upstream
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(phone,
                    style: TextStyle(fontWeight: FontWeight.bold)),
=======
            margin: const EdgeInsets.fromLTRB(0, 16, 16, 16),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              children: [
                const ClipOval(
                  child: Image(
                    height: 90,
                    width: 90,
                    image: NetworkImage('https://i.ibb.co/FnSxqF1/rosamund.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      userModel.phone,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
>>>>>>> Stashed changes
              ],
            ),
          ),
        );
      },
    );
  }
}