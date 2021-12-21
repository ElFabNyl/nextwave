import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Function() onTap;
  final String foodName;
  final String restaurantNameAndLocation;
  final String distanceFromCurrentPosition;
  final String foodPrice;
  final String imagePath;

  const FoodCard({
    Key? key,
    required this.onTap,
    required this.foodName,
    required this.restaurantNameAndLocation,
    required this.distanceFromCurrentPosition,
    required this.foodPrice,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Material(
                child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      height: 65,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  restaurantNameAndLocation,
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  distanceFromCurrentPosition,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  foodPrice,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
