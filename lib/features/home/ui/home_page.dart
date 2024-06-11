import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/nav/ui/nav_bar.dart';
import 'package:carhelp/features/home/ui/home_page_sliver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final locationFetch = context.watch<LocationFetch>();
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Text((context)
                                  .watch<LocationFetch>()
                                  .placemarkName),
                              Text((context).watch<LocationFetch>().streetName),
                              Text((context)
                                  .watch<LocationFetch>()
                                  .localityName),
                              Text((context)
                                  .watch<LocationFetch>()
                                  .sublocalityName),
                              Text((context).watch<LocationFetch>().postalCode),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: theme.colorScheme.tertiary),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: theme.colorScheme.primary,
                  ),
                  child: Text(
                    (context).watch<LocationFetch>().locationText,
                    style: TextStyle(
                      color: theme.colorScheme.tertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/shop');
                },
                icon: const Icon(Icons.shopping_bag_rounded),
                color: theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: theme.colorScheme.background,
      body: const HomePageSliver(),
    );
  }
}
