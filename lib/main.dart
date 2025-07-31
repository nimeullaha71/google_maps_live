import 'package:flutter/material.dart';
import 'package:google_maps_live/home_screen.dart';

void main(){
  runApp(GoogleMapsApp());
}

class GoogleMapsApp extends StatelessWidget {
  const GoogleMapsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
