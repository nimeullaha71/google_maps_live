import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          zoom: 17,
          target: LatLng(23.751259643181236, 90.39059719213645),
        ),
        zoomControlsEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        onTap: (LatLng latlng) {
          print(latlng);
        },
        markers: {
          Marker(
              markerId: MarkerId("My-Location"),
              position: const LatLng(23.751259643181236, 90.39059719213645),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              onTap: () {
                print("Tapped on my Marker");
              },
              infoWindow: InfoWindow(
                  title: "My Location",
                  onTap: () {
                    print("Tapped on info window");
                  })),
          Marker(
              markerId: MarkerId("Your-Location"),
              position: const LatLng(23.750714058174058, 90.39258760375519),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              onTap: () {
                print("Tapped on my Marker");
              },
              infoWindow: InfoWindow(
                  title: "My Location",
                  onTap: () {
                    print("Tapped on info window");
                  })),
          Marker(
              markerId: MarkerId("Drag-Location"),
              position: const LatLng(23.75128045057905, 90.38865789126878),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              onTap: () {
                print("Tapped on my Marker");
              },
              visible: true,
              draggable: true,
              onDrag: (LatLng latlng) {},
              onDragStart: (LatLng startedLatLng) {},
              onDragEnd: (LatLng endLatLng) {
                print(endLatLng);
              },
              infoWindow: InfoWindow(
                  title: "My Location",
                  onTap: () {
                    print("Tapped on info window");
                  })),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId("StraightLine"),
            width: 4,
            color: Colors.pink,
            endCap: Cap.roundCap,
            startCap: Cap.roundCap,
            points: [
              LatLng(23.751259643181236, 90.39059719213645),
              LatLng(23.75128045057905, 90.38865789126878),
              LatLng(23.750714058174058, 90.39258760375519),
            ],
            jointType: JointType.round,
          )
        },
        circles: {
          Circle(
            circleId: CircleId("Virus"),
            center: LatLng(23.751315485074812, 90.39272157106356),
            radius: 300,
            strokeWidth: 3,
            strokeColor: Colors.red,
            fillColor: Colors.red.withOpacity(0.2),
          ),
        },
        polygons: {
          Polygon(
              polygonId: PolygonId("Random-polugon"),
              fillColor: Colors.pink.withOpacity(0.2),
              strokeColor: Colors.yellow,
              points: [
                LatLng(23.751321324157367, 90.39170086652163),
                LatLng(23.751782610851908, 90.39161793427759),
                LatLng(23.75135635864721, 90.39104378797276),
                LatLng(23.751800128035942, 90.3908843028881),
              ])
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _mapController.moveCamera(CameraUpdate.newCameraPosition(
          //     CameraPosition(
          //         target: LatLng(23.73175687131579, 90.39663464322666))));

          _mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 14,
                  target: LatLng(23.73175687131579, 90.39663464322666))));
        },
        child: Icon(Icons.train),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mapController.dispose();
  }
}
