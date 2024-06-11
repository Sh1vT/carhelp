import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/home/themes/themeProvider.dart';
import 'package:carhelp/features/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=> themeProvider()
    ,child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocationFetch()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: Provider.of<themeProvider>(context).themeData,
      ),
    );
  }
}
