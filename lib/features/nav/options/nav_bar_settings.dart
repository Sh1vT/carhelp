import 'package:carhelp/features/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carhelp/features/themes/theme_data.dart';

class NavSettingsPage extends StatelessWidget {
  const NavSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
          ),
          onPressed: () => Navigator.pop(context), // Concise arrow function syntax
        ),
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Toggle Theme"),
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).themeData == lightTheme,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              activeColor: Colors.black,
              thumbColor: MaterialStateProperty.all(Colors.white),
            ),
          )
        ]
        ,)
    );
  }
}
