import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/home/ui/home_page_alert_row.dart';
import 'package:carhelp/features/nav/ui/nav_bar.dart';
import 'package:carhelp/features/home/ui/home_page_sliver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          height: 160,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'You\'re here',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.check_rounded,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              HomePageAlertRow(
                                  fieldName: 'Nearest Stop',
                                  fieldValue: context
                                      .watch<LocationFetch>()
                                      .placemarkName),
                              HomePageAlertRow(
                                  fieldName: 'Street',
                                  fieldValue: context
                                      .watch<LocationFetch>()
                                      .streetName),
                              HomePageAlertRow(
                                  fieldName: 'Sub-locality',
                                  fieldValue: context
                                      .watch<LocationFetch>()
                                      .sublocalityName),
                              HomePageAlertRow(
                                  fieldName: 'Locality',
                                  fieldValue: context
                                      .watch<LocationFetch>()
                                      .localityName),
                              HomePageAlertRow(
                                  fieldName: 'Postal code',
                                  fieldValue: context
                                      .watch<LocationFetch>()
                                      .postalCode),
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
                    border: Border.all(width: 2, color: Colors.grey.shade700),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    (context).watch<LocationFetch>().locationText,
                    style: TextStyle(
                      color: Colors.grey.shade700,
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
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ),
      body: HomePageSliver(),
    );
  }
}
