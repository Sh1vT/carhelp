import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavAccountPage extends StatefulWidget {
  const NavAccountPage({super.key});

  @override
  State<NavAccountPage> createState() => _NavAccountPageState();
}

class _NavAccountPageState extends State<NavAccountPage> {
  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.popUntil(context, (route) => route.isFirst);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Account Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              trailing: CupertinoButton(
                onPressed: logOut,
                child: Icon(
                  Icons.logout,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
