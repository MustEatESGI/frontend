

import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:must_eat_gui/ui/home/home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List l = List.generate(30, (index) => "Test $index");

    return Scaffold(
      appBar: CustomAppBar(context: context, location: "/cart",),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Articles', 'Quantité', 'Prix'].map((e) => Text(e, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))).toList(),),
          ),
          Divider(),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 50),
                itemCount: l.length,
                itemBuilder: (context, index) {
              return ProductTile();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(height: 40, child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('TOTAL : '),
                SizedBox(width: 20,),
                Text('45.50 EUROS'),
                SizedBox(width: 20,),
                GFButton(
                  onPressed: (){},
                  text: "Payer",
                  color: GFColors.DANGER,
                ),
              ],
            ),),
          )
        ],
      ),
    );
  }
}


class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Jambon beurre'), Text('2'), Text('10.99')],),
      ),
    );
  }
}
