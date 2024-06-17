import 'package:carhelp/features/theme_provider.dart';
import 'package:carhelp/features/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavSettingsPage extends StatelessWidget {
  const NavSettingsPage({super.key});

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
          onPressed: () => Navigator.pop(context), 
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
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: const Text("Dark Mode", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              trailing: Switch(
                value: Provider.of<ThemeProvider>(context).themeData == darkTheme,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                activeColor: theme.colorScheme.primary,
                thumbColor: MaterialStateProperty.all(theme.colorScheme.secondary),
              ),
            ),
          )
        ]
        ,)
    );
  }
}
