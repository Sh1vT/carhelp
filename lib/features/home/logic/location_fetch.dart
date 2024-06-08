import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';


class LocationFetch extends ChangeNotifier{
  LatLng _currentLocation = const LatLng(0, 0);
  LatLng get currentLocation => _currentLocation;

  String locationText = 'Hit Refresh!';

  Future<void> resetLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      _currentLocation = LatLng(position.latitude, position.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(currentLocation.latitude, currentLocation.longitude);
      
      locationText = 'Hey! You\'re at ${placemarks.first.street!}';
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }
}
