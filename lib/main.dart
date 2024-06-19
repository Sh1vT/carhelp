import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/theme_provider.dart';
import 'package:carhelp/features/route_generator.dart';
import 'package:carhelp/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carhelp/features/user_model.dart'; // Import UserModel

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationFetch()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserModel()), // Add UserModel provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (FirebaseAuth.instance.currentUser != null) ? '/home' : '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
