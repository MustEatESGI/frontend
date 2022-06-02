import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:must_eat_gui/ui/home/home_page.dart';

import '../core/custom_app_bar.dart';
import '../states/order/order_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List l = List.generate(30, (index) => "Test $index");
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        location: "/cart",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Articles', 'Quantité', 'Prix']
                  .map((e) => Text(e,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)))
                  .toList(),
            ),
          ),
          const Divider(),
          Flexible(
            child: BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                if (state.meals == null) return const SizedBox();
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    itemCount: state.meals?.length,
                    itemBuilder: (context, index) {
                      return const ProductTile();
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('TOTAL : '),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      if (state.meals == null) return const SizedBox();
                      return Text('${state.totalPrice}EUROS');
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GFButton(
                    onPressed: () {
                      context.read<OrderCubit>().payCommand(context);
                    },
                    text: "Payer",
                    color: GFColors.DANGER,
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<OrderCubit>().clearCommand();
                      },
                      icon: const Icon(
                        Icons.delete_forever_sharp,
                        color: GFColors.DANGER,
                      ))
                ],
              ),
            ),
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
          children: [
            const Text('Jambon beurre'),
            const Text('2'),
            const Text('10.99')
          ],
        ),
      ),
    );
  }
}
