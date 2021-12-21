import 'package:flutter/material.dart';

class TopFeatures extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final String imagePath3;
  final String imagePath4;
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  final Function() onTap1;
  final Function() onTap2;
  final Function() onTap3;
  final Function() onTap4;

  const TopFeatures({
    Key? key,
    required this.imagePath1,
    required this.imagePath2,
    required this.imagePath3,
    required this.imagePath4,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onTap1,
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: Image.asset(
                  imagePath1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              label1,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onTap2,
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: Image.asset(
                  imagePath2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              label2,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onTap3,
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: Image.asset(
                  imagePath3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              label3,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey),
            )
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onTap4,
              child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: Image.asset(
                  imagePath4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              label4,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
