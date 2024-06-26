import 'package:carhelp/features/nav/ui/nav_bar_tiles.dart';
import 'package:carhelp/features/nav/ui/nav_bar_user_tile.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.colorScheme.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: ListView(
        children: const [
          UserTile(),
          NavBarTile(name: 'Help', icon: Icons.question_mark_rounded, settings: '/help'),
          NavBarTile(name: 'Account', icon: Icons.person, settings: '/account'),
          NavBarTile(name: 'Wallet', icon: Icons.wallet, settings: '/wallet'),
          NavBarTile(name: 'Referrals', icon: Icons.monetization_on_rounded, settings: '/referrals'),
          NavBarTile(name: 'Settings', icon: Icons.settings, settings: '/settings'),
        ],
      ),
    );
  }
}
