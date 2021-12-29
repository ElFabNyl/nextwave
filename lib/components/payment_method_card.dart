import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String imagePath;
  final String description;
  final Function() onTap;
  const PaymentMethodCard({
    Key? key,
    required this.imagePath,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.14,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffE7E7E7),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 65.0,
                    width: 65.0,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 18.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
