import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:must_eat_gui/ui/home/restaurant_card.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';



class RestaurantsGrid extends StatelessWidget {
  const RestaurantsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 18,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            final item = state.restaurants![index];
            return RestaurantCard(
              index: index,
              restaurant: item,
            );
          });
    });
  }
}