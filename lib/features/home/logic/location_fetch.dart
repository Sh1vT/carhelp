import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';


class LocationFetch extends ChangeNotifier{
  LatLng _currentLocation = LatLng(0, 0);
  String locationText = 'Loading...';
  String streetName = '';
  String placemarkName = '';
  String postalCode = '';
  String localityName = '';
  String sublocalityName = '';

  LatLng get currentLocation => _currentLocation;

  Future<void> resetLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      _currentLocation = LatLng(position.latitude, position.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
      
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
}
