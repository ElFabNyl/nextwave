import 'package:flutter/material.dart';

class AddFoodTocard extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String foodPrice;
  final Function() onPressed;

  const AddFoodTocard({
    Key? key,
    required this.imagePath,
    required this.foodName,
    required this.foodPrice,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        child: Row(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 15.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric( vertical: 15.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18.0),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        foodPrice,
                        style: const TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: onPressed,
                        child: const Text(
                          '+ ADD',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
