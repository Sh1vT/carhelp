import 'package:animate_do/animate_do.dart';
import 'package:carhelp/features/home/logic/location_fetch.dart';
import 'package:carhelp/features/home/ui/mechanic_tiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class HomePageSliver extends StatefulWidget {
  const HomePageSliver({super.key});

  @override
  State<HomePageSliver> createState() => _HomePageSliverState();
}

class _HomePageSliverState extends State<HomePageSliver> {
  @override
  void initState() {
    super.initState();
    context.read<LocationFetch>().getCollectionLength();
    context.read<LocationFetch>().updateMarkers();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mapController = MapController();
    final locationFetch = context.watch<LocationFetch>();

    if (locationFetch.currentLocation == LatLng(0, 0)) {
      return Center(
        child: CircularProgressIndicator(
          color: theme.colorScheme.tertiary,
        ),
      );
    }

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
              minZoom: 10,
              center: locationFetch.currentLocation,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                // markers: [
                //   Marker(
                //     point: (context).watch<LocationFetch>().currentLocation,
                //     builder: (context) => Bounce(
                //       child: const SizedBox(
                //         width: 48,
                //         height: 48,
                //         child: Icon(
                //           Icons.location_on,
                //           size: 32,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ),
                //   )
                // ],
                markers: [
                      Marker(
                        point: (context).watch<LocationFetch>().currentLocation,
                        builder: (context) => Bounce(
                          child: const SizedBox(
                            width: 48,
                            height: 48,
                            child: Icon(
                              Icons.location_on,
                              size: 32,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ] +
                    context.watch<LocationFetch>().markerList,
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
                        mapController.move(locationFetch.currentLocation, 15);
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
          backgroundColor: theme.colorScheme.background,
          expandedHeight: 8,
          automaticallyImplyLeading: false,
          collapsedHeight: 16,
          toolbarHeight: 16,
          flexibleSpace: const Icon(Icons.keyboard_arrow_up_rounded),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("mechanics")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData && snapshot.data != null) {
                    Map<String, dynamic> mechanicMap =
                        snapshot.data!.docs[index].data();
                    GeoPoint mechanicCoords = mechanicMap["coords"];
                    if (locationFetch.within2kms(
                        LatLng(
                            mechanicCoords.latitude, mechanicCoords.longitude),
                        locationFetch.currentLocation)) {
                      return MechanicTile(
                        name: mechanicMap["name"],
                        number: mechanicMap["phone"],
                        address: mechanicMap["address"],
                        distance: "Within 2 kms",
                        mechanicLatLng: mechanicCoords,
                      );
                    } else if (locationFetch.within5kms(
                        LatLng(
                            mechanicCoords.latitude, mechanicCoords.longitude),
                        locationFetch.currentLocation)) {
                      return MechanicTile(
                          name: mechanicMap["name"],
                          number: mechanicMap["phone"],
                          address: mechanicMap["address"],
                          distance: "Within 5 kms",
                          mechanicLatLng: mechanicCoords,);
                    } else {
                      return Container();
                    }
                  } else {
                    debugPrint('Snapshot has null data');
                    return const SnackBar(content: Text('No data'));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          }, childCount: locationFetch.mechanicCount),
        ),
      ],
    );
  }
}
