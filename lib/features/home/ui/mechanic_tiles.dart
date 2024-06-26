import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MechanicTile extends StatelessWidget {
  final String name;
  final String number;
  final String address;
  final String distance;
  final GeoPoint mechanicLatLng;
  const MechanicTile(
      {super.key,
      required this.name,
      required this.number,
      required this.address,
      required this.distance,
      required this.mechanicLatLng});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2, color: theme.colorScheme.tertiary),
        color: theme.colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(100),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: theme.colorScheme.tertiary),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: const Icon(Icons.map),
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://www.google.com/maps?saddr=My+Location&daddr=${mechanicLatLng.latitude},${mechanicLatLng.longitude}'));
                  },
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  child: const Icon(Icons.call),
                  onTap: () {
                    launchUrl(
                      Uri.parse(
                        'tel: $number',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  Text(address),
                  Text(distance),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
