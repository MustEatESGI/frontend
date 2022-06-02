


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.index,
    required this.id,
    required this.name,
    required this.deliveryTime,
    required this.price,
    required this.posterURL,
  }) : super(key: key);

  final int index;
  final String name, id;
  final String deliveryTime;
  final String price;
  final String posterURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          context.go('/restaurant/$id');
        },
        child: Stack(
          children: [
            Card(
              elevation: 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Flexible(
                      flex: 4,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          posterURL,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Flexible(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(fontWeight: FontWeight.w700),
                              ),
                              Text(deliveryTime),
                              Text(
                                price,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}