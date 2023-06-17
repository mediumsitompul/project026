import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("GOOGLE MAP")),
        ),
        body: MyMap(),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  LatLng showLocation1 = LatLng(-12.46282, 130.841769); // Darwin, Australia
  LatLng showLocation2 = LatLng(-33.856159, 151.215256); // Sydney, Australia
  LatLng showLocation3 = LatLng(3.602, 98.625); //Medan, Indonesia
  Set<Marker> marker1 = Set();

  MapType _currentMapType = MapType.normal;
  void _on_MapType_ButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    //...........................................................................
    marker1.add(Marker(
        markerId: MarkerId(showLocation1.toString()),
        position: showLocation1,
        infoWindow: InfoWindow(title: "Medan", snippet: "Indonesia")));
    //.......................................................................
    marker1.add(Marker(
        markerId: MarkerId(showLocation2.toString()),
        position: showLocation2,
        infoWindow: InfoWindow(title: "Sidney", snippet: "Australia")));
    //.......................................................................
    marker1.add(Marker(
        markerId: MarkerId(showLocation3.toString()),
        position: showLocation3,
        infoWindow: InfoWindow(title: "Medan", snippet: "Indonesia")));
    //.......................................................................
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: showLocation1,
              zoom: 0,
              tilt: 0.0,
              bearing: 0.0,
            ),
            markers: marker1,
            //mapType: MapType.satellite,
            mapType: _currentMapType,
          ),
          Positioned(
            child: FloatingActionButton(
              onPressed: _on_MapType_ButtonPressed,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.map,
                size: 30,
              ),
            ),
            bottom: 40,
            height: 80,
          ),
          Positioned(
            child: Text("By Medium"),
            right: 10,
            top: 10,
          )
        ],
      ),
    );
  }
}
