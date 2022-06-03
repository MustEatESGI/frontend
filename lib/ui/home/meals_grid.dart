

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import 'meal_card.dart';

class MealsGrid extends StatelessWidget {
  const MealsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: state.meals!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            final item = state.meals![index];
            return MealCard(
              restaurantId: item.restaurantId!.toString(),
              id: item.id!.toString(),
              index: index,
              name: item.name!,
              deliveryTime: '0 min',
              price: convertPrice(item.price),
              posterURL: item.picture!,
            );
          });
    });
  }
}