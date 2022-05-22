import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:go_router/go_router.dart';

import '../home/home_page.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key, required this.restaurantID}) : super(key: key);

  final String restaurantID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        location: "/restaurant",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Pizza Pino $restaurantID',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Flexible(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Placeholder(
                            fallbackHeight: 60,
                            fallbackWidth: 60,
                          ),
                          Text('pomme'),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle))
                        ],
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GFButton(
                    onPressed: () {
                      context.go('/cart');
                    },
                    text: "Aller au panier",
                    color: GFColors.DANGER,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
