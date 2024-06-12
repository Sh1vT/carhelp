import 'package:carhelp/features/home/ui/home_page.dart';
import 'package:carhelp/features/nav/options/nav_bar_account.dart';
import 'package:carhelp/features/nav/options/nav_bar_help.dart';
import 'package:carhelp/features/nav/options/nav_bar_referral.dart';
import 'package:carhelp/features/nav/options/nav_bar_settings.dart';
import 'package:carhelp/features/nav/options/nav_bar_wallet.dart';
import 'package:carhelp/features/nav/ui/nav_bar.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments; //To take in arguments while routing
    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage()); //For Home page

      case '/nav':
        return MaterialPageRoute(builder: (_) => const NavBar()); //For Nav Bar

      case '/help':
        return MaterialPageRoute(builder: (_) => const NavHelpPage()); //Nav Bar Option 1 -Help Page
      
      case '/account':
        return MaterialPageRoute(builder: (_) => const NavAccountPage()); //Nav Bar Option 2 -Account Page

      case '/wallet':
        return MaterialPageRoute(builder: (_) => const NavWalletPage()); //Nav Bar Option 3 -Wallet Page

      case '/referrals':
        return MaterialPageRoute(builder: (_) => const NavReferralsPage()); //Nav Bar Option 4 -Referrals Page

      case '/settings':
        return MaterialPageRoute(builder: (_) => const NavSettingsPage()); //Nav Bar Option 5 -Settings Page

      
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    },
  );
}
