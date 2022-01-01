import 'package:flutter/material.dart';
import 'package:nextwave/components/tracking_card.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            TrackingCard(
              title: 'Sent courier',
              time: '14:30 12.01.2021',
              initialPoint: 'Obili',
              finalPoint: 'Efoulan',
              status: 'waiting for agent',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/delivery_details');
              },
            ),
            const SizedBox(height: 15),
            TrackingCard(
              title: 'Sent courier',
              time: '14:30 12.01.2021',
              initialPoint: 'Bastos',
              finalPoint: 'Etoug-Ebe',
              status: 'In transit',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/delivery_details');
              },
            ),
            const SizedBox(height: 15),
            TrackingCard(
              title: 'Sent courier',
              time: '14:30 12.01.2021',
              initialPoint: 'France',
              finalPoint: 'Cameroun',
              status: 'completed',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
