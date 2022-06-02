import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.index,
    required this.restaurant,
  }) : super(key: key);

  final int index;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          context.go('/restaurant/${restaurant.id}');
        },
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Flexible(
                  flex: 4,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      restaurant.imageUrl!,
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
                            restaurant.name!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(restaurant.distance!),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
