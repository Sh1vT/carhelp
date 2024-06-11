import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/home/ui/mechanic_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class HomePageSliver extends StatefulWidget {
  const HomePageSliver({super.key});

  @override
  State<HomePageSliver> createState() => _HomePageSliverState();
}

final mapController = MapController();

class _HomePageSliverState extends State<HomePageSliver> {
  @override
  Widget build(BuildContext context) {

    final theme=Theme.of(context);

    final locationFetch = context.watch<LocationFetch>();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
          automaticallyImplyLeading: false,
          expandedHeight: MediaQuery.of(context).size.height - 220,
          collapsedHeight: 60,
          flexibleSpace: FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialZoom: 17,
              initialCenter: locationFetch.currentLocation,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                // Plenty of other options available!
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: (context).watch<LocationFetch>().currentLocation,
                    child: const Icon(Icons.location_on, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(0, 0),
            child: Transform.translate(
              offset: Offset((MediaQuery.of(context).size.width / 2) - 30, 0),
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.grey.shade900,
                  shape: const CircleBorder(eccentricity: 0),
                  onPressed: () async {
                    await Provider.of<LocationFetch>(context, listen: false)
                        .resetLocation();
                    setState(
                      () {
                        mapController.move(locationFetch.currentLocation, 17);
                      },
                    );
                  },
                  child: const Icon(
                    Icons.location_searching_rounded,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
         SliverAppBar(
          backgroundColor:theme.colorScheme.background,
          expandedHeight: 8,
          automaticallyImplyLeading: false,
          collapsedHeight: 16,
          toolbarHeight: 16,
          flexibleSpace: Icon(Icons.keyboard_arrow_up_rounded),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: MechanicTile(
                  name: 'Placeholder name',
                  number: 'Placeholder number',
                  address: 'Placeholder address'),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}
