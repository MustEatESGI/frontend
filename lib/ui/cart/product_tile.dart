

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
          SizedBox(
              width: 100,
              height: 100,
              child: Image.network(meal.picture!, fit: BoxFit.cover,)),
          SizedBox(width: 20,),
          SizedBox(
              width: 400,
              child: Text(meal.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Text('1'),
          Container(
            padding: EdgeInsets.only(right: 20),
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(convertPrice(meal.price), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              )),

        ],
      ),
    );
  }
}
