import 'dart:convert';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import '../models/googleMapModels.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const apiKey = "api_key";

Future<String> getRouteCoordinates(LatLng l1, LatLng l2)async{
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey";
    http.Response response = await http.get(Uri.parse(url));
    Map values = jsonDecode(response.body);
    return (values["routes"][0]["overview_polyline"]["points"]);
}

Future<Locations> getGoogleOffices() async {
  const googleLocationsURL = 'https://about.google/static/data/locations.json';
  String regions = 'regions';
  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(googleLocationsURL));
    if (response.statusCode == 200) {
      //print('${response.body}');
      return Locations.fromJson(json.decode(response.body));
    }
  } catch (e) {
    print(e);
  }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ),
  );
}


class MapGoogle extends StatefulWidget {
  const MapGoogle({super.key});

  @override
  State<MapGoogle> createState() => _MapGoogleState();
}

class _MapGoogleState extends State<MapGoogle> {

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await getGoogleOffices();
    
    setState(() {
      _markers.clear();
      
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
          
        );
        _markers[office.name] = marker;
      }
    });
  }
double x = 33.981014088906036;
  double y = -6.865372171784317;
  
  

  LatLng _lastMapPosition = LatLng(33.981014088906036, -6.865372171784317);
   void _onCameraMove(CameraPosition position) {
    setState(() {
      print( position.target);
      _lastMapPosition = position.target;
    });
  }

  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  //static const LatLng destination = LatLng(37.33429383, -122.06600055);
  //List<LatLng> polylineCoordinates = [LatLng(37.33500926, -122.03272188), LatLng(37.33429383, -122.06600055)];

  LocationData? currentLocatrion;

  final Set<Polyline> _polyline = {};

  static const LatLng source = LatLng(33.981014088906036, -6.865372171784317);
  static const LatLng destination = LatLng(33.991014088906037, -6.875372171784327);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async{
    PolylinePoints polylinePooints = PolylinePoints();

    PolylineResult result = await polylinePooints.getRouteBetweenCoordinates(
      apiKey , 
      PointLatLng(source.latitude, source.longitude), 
      PointLatLng(destination.latitude, destination.longitude), 
    );
    print('###################### ${result.errorMessage}');
    if(result.points.isNotEmpty) {
      
      
      setState(() {
        result.points.forEach((PointLatLng point) => polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
      });
    }
  }
  
  @override
  void initState() {
    //getRouteCoordinates(LatLng(33.981014088906036, -6.865372171784317), LatLng(33.991014088906037, -6.875372171784327));
    _polyline.add(
      Polyline(
            polylineId: PolylineId('1'),
            points: [LatLng(33.981014088906036, -6.865372171784317),LatLng(33.991014088906037, -6.875372171784327)],
            color: Colors.green,
          )
    );
    getPolyPoints();
    super.initState();
  }

final Completer<GoogleMapController> _mapController = Completer();
  @override
  Widget build(BuildContext context) {
    final Map<String, Marker> marker = {
    'INPT':const  Marker(
      markerId: MarkerId('INPT'),
      position: LatLng(33.981014088906036, -6.865372171784317),
      infoWindow: InfoWindow(
        title: 'INPT',
        snippet: 'MADINAT ALIRFAN, Rabat',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    'Hello':const  Marker(
      markerId: MarkerId('Hello'),
      position: LatLng(33.991014088906037, -6.875372171784327),
      infoWindow: InfoWindow(
        title: 'hello',
        snippet: 'MADINAT ALIRFAN, Rabat',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
  };
    return GoogleMap(
      myLocationButtonEnabled: false,
      compassEnabled: true,
      padding: EdgeInsets.only(
      bottom:MediaQuery.of(context).size.height*0.25),
      tiltGesturesEnabled: false,
      mapType: MapType.terrain,
      onMapCreated:(mapController) {
        _mapController.complete(mapController);
      }, //_onMapCreated,
      initialCameraPosition:  CameraPosition(
        target: LatLng(x,y),
        zoom: 14,
      ),
      markers: marker.values.toSet(),
      polylines: _polyline,
      onTap: (LatLng latLng) async{
        // you have latitude and longitude here 
        
        var latitude = latLng.latitude;
        var longitude = latLng.longitude;
        print("$latitude   ########### $longitude");
        final cont =await _controller.future;
        setState(() {
          
        });
        await cont.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(latitude,longitude),
              zoom: 37,
            ),
          )
        );
        setState(() {
          
        });
        setState(() {
          marker.addAll({
            latitude.toString():  Marker(
              markerId: MarkerId(longitude.toString()),
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(
                title: 'INPT',
                snippet: 'MADINAT ALIRFAN, Rabat',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
            )
          });
        });
      },
    );
  }
}