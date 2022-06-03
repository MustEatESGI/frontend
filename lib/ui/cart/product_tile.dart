

import 'package:flutter/material.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/models/meal.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(meal.picture!, fit: BoxFit.cover,)),
              SizedBox(width: 20,),
              Text(meal.name!),
            ],
          ),
          Text('1'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(convertPrice(meal.price)),
          ),
        ],
      ),
    );
  }
}
