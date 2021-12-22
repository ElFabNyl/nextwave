import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final Function() onTap;
  final String articleName;
  final String articlePrice;
  final String imagePath;
  const ShopCard({
    Key? key,
    required this.onTap,
    required this.articleName,
    required this.articlePrice,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Card(
          elevation: 6.0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.25,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
              child: GridTile(
                footer: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articleName,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                        Text(
                          articlePrice,
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
