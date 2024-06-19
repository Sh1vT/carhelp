import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class LocationFetch extends ChangeNotifier {
  LatLng _currentLocation = LatLng(0, 0);
  String locationText = 'Loading...';
  String streetName = '';
  String placemarkName = '';
  String postalCode = '';
  String localityName = '';
  String sublocalityName = '';
  int mechanicCount = 0;

  LatLng get currentLocation => _currentLocation;

  Future<void> resetLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      _currentLocation = LatLng(position.latitude, position.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentLocation.latitude, currentLocation.longitude);

      locationText = 'Hey! You\'re at ${placemarks.first.street!}';
      streetName = placemarks.first.street!;
      placemarkName = placemarks.first.name!;
      postalCode = placemarks.first.postalCode!;
      localityName = placemarks.first.locality!;
      sublocalityName = placemarks.first.subLocality!;

      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  

  Future<void> getCollectionLength() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection("mechanics").get();
    mechanicCount = querySnapshot.docs.length;
    notifyListeners();
  }

  List<Marker> markerList = [];
  
  Future<void> updateMarkers() async {
    // Clear existing markers before fetching new data
    markerList.clear();

    // Fetch mechanics data from Firestore
    final querySnapshot = await FirebaseFirestore.instance
        .collection("mechanics")
        .get();

    for (final doc in querySnapshot.docs) {
      final mechanicMap = doc.data();
      if (mechanicMap.containsKey("coords") &&
          mechanicMap["coords"] is GeoPoint) {
        final geopoint = mechanicMap["coords"] as GeoPoint;
        final marker = Marker(
          point: LatLng(geopoint.latitude, geopoint.longitude),
          builder: (context) => Icon(
            Icons.add_location,
            size: 28,
            color: Colors.green.shade700,
          ),
        );
        markerList.add(marker);
      }
    }

    notifyListeners(); // Notify listeners about updated markerList
  }

  
}
