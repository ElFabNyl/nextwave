// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:nextwave/components/app_bar.dart';
import 'package:nextwave/components/delivery_path_details.dart';
import 'package:nextwave/components/elevated_button.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);

  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  //google map
  final Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_constructors
  static final Marker _initialPosition = Marker(
    markerId: const MarkerId('_initialPosition'),
    infoWindow: const InfoWindow(title: 'Pickup position'),
    icon: BitmapDescriptor.defaultMarker,
    position: const LatLng(3.866667, 11.516667),
  );
  // ignore: prefer_const_constructors
  static final Marker _finalPosition = Marker(
    markerId: const MarkerId('_finalPosition'),
    infoWindow: const InfoWindow(title: 'final position'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: const LatLng(3.996667, 11.516667),
  );
  //polyline to link the two points
  static final Polyline _polyline = Polyline(
    color: Colors.blue,
    polylineId: PolylineId('polyline'),
    points: const [
      LatLng(3.866667, 11.516667),
      LatLng(3.996667, 11.516667),
    ],
    width: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShoppingBag: false,
        showBell: false,
        showBadge: false,
        title: Text('Send Parcel'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: GoogleMap(
                    markers: {_initialPosition, _finalPosition},
                    
                    polylines: {_polyline},
                    trafficEnabled: true,
                    mapToolbarEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(3.866667, 11.516667),
                      zoom: 12.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DeliveryPathDetails(
                        label1: 'Pickup',
                        value1: 'Efoulan',
                        label2: 'Delivery',
                        value2: 'Obili',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      DeliveryPathDetails(
                        label1: 'Size',
                        value1: '25*25*25',
                        label2: 'Weight',
                        value2: '50g',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      DeliveryPathDetails(
                        label1: 'Distance',
                        value1: '4km',
                        label2: 'Cost',
                        value2: '1000 FCFA',
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultElevatedButton(
                        text: const Text('Back'),
                        showArrowBack: true,
                        showArrowFoward: false,
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    DefaultElevatedButton(
                        text: const Text('Confirm'),
                        showArrowBack: false,
                        showArrowFoward: true,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/terms_and_conditions2');
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
