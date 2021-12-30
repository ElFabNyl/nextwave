import 'package:flutter/material.dart';

class TrackingCard extends StatelessWidget {
  final String title;
  final String time;
  final String initialPoint;
  final String finalPoint;
  final String status;
  final Function() onTap;
  

  const TrackingCard({
    Key? key,
    required this.title,
    required this.time,
    required this.initialPoint,
    required this.finalPoint,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffEDEDED),
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    title,
                    style:const TextStyle(
                        color: Color(0xff980000),
                        fontWeight: FontWeight.w900,
                        fontSize: 22.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                     const Icon(
                        Icons.lock_clock,
                        color: Colors.grey,
                      ),
                     const  SizedBox(width: 10.0),
                      Text(
                        time,
                        style: const  TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                     const Text(
                        'From ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0),
                      ),
                      Text(
                        initialPoint,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0),
                      ),
                    const  Text(
                        '>',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.0),
                      ),
                      Text(
                        finalPoint,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.0),
                      )
                    ],
                  ),
                   Text(
                    status,
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
