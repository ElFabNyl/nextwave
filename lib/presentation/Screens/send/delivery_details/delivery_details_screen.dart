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
  final Completer<GoogleMapController> _controller = Completer();
  static final Marker _kGoogPlexMaker =  Marker(
    markerId: MarkerId('_kGoogPlexMaker'),
    infoWindow: InfoWindow(title: 'Pickup position'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: GoogleMap(
                markers: {},
                mapToolbarEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15.0),
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
                      Navigator.of(context).pushNamed('/terms_and_conditions2');
                    })
              ],
            )
          ],
        ),
      ))),
    );
  }
}
