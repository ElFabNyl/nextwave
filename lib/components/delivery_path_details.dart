import 'package:flutter/material.dart';

class DeliveryPathDetails extends StatelessWidget {
  final String label1;
  final String label2;
  final String value1;
  final String value2;
  const DeliveryPathDetails({
    Key? key,
    required this.label1,
    required this.label2,
    required this.value1,
    required this.value2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label1,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5.0),
            Text(
              value1,
              style: const TextStyle(color: Colors.grey, fontSize: 16.0),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          
          children: [
            Text(
              label2,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5.0),
            Text(
              value2,
              style: const TextStyle(color: Colors.grey, fontSize: 16.0),
            )
          ],
        ),
      ],
    );
  }
}
