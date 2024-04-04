import 'package:cabira/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
String firstLocation = "", lat = "", lng = "";

class GetLocation {
  LocationData? _currentPosition;

  late String _address = "";
  ValueChanged onResult;

  GetLocation(this.onResult);


  Future<void> getCurrentLoc(BuildContext context) async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    }
    Position position = await Geolocator.getCurrentPosition();

     lat = position.latitude.toString();
     lng = position.longitude.toString();
    print("locationnnn $lat $lng");

    var res = getAddress(position.latitude, position.longitude);
    onResult(res);
   // firstLocation  =(await  getAddress(position.latitude, position.longitude)).first.addressLine;
     // firstLocation=placemark[0].locality! + " ," + placemark[0].subLocality!;
  }
 }


Future<List<Address>> getAddress(double? lat, double? lang) async {
  final coordinates = new Coordinates(lat, lang);
  List<Address> add =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  return add;
}
