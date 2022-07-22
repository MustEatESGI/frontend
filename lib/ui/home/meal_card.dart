


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.index,
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.deliveryTime,
    required this.price,
    required this.posterURL,
  }) : super(key: key);

  final int index;
  final String name, id, restaurantId;
  final String deliveryTime;
  final String price;
  final String posterURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.go('/restaurant/$restaurantId');
        GoRouter.of(context).push('/restaurant/$restaurantId');
      },
      child: Card(
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                posterURL,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(deliveryTime),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            price,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
