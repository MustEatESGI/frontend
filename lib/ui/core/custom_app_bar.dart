import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';

import '../home/home_page.dart';
import '../home/search_option.dart';
import '../states/order/order_cubit.dart';
import '../states/search/search_cubit.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key, required BuildContext context, required String location})
      : super(
    key: key,
    toolbarHeight: 70,
    actions: [
      Stack(
        children: [
          IconButton(
              padding: const EdgeInsets.all(20),
              onPressed: () {
                context.read<SearchCubit>().reset();
                GoRouter.of(context).go('/');
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      Stack(
        children: [
          IconButton(
              padding: const EdgeInsets.all(20),
              onPressed: () {
                context.read<OrderCubit>().computeTotalPrice();
                GoRouter.of(context).push('/cart');
              },
              icon: const Icon(Icons.shopping_cart_rounded)),
          Positioned(
              bottom: 10,
              right: 10,
              child: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
                return Text(state.meals != null  ? state.meals!.length.toString() : '', style: const TextStyle(fontWeight: FontWeight.bold),);
              }))
        ],
      ),
    ],
    title: location == '/'
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),
          elevation: 00,
          child: SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Rechercher un repas",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
                onChanged:
                context.read<SearchCubit>().getByMealAndFilter,
              )),
        ),
        const SizedBox(width: 20),
        SearchOption(
          onFiltersChanged:
          context.read<SearchCubit>().onFiltersChanged,
        ),
      ],
    )
        : null,
    backgroundColor: const Color(0xFFFB2629),
    leading: Image.network(
      'https://media.discordapp.net/attachments/962421715407880272/962454577813270549/unknown.png',
      scale: 3,
    ),
  ) {}
}
