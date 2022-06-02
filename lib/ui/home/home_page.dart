import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:must_eat_gui/ui/home/restaurants_grid.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import '../core/custom_app_bar.dart';
import 'meals_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar(
              context: context,
              location: "/",
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 40),
                const SizedBox(height: 10),
                Text(
                  state.isTrendy
                      ? 'Les restaurants tendances près de chez vous'
                      : 'Vos résultats',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: state.isTrendy
                      ? const RestaurantsGrid()
                      : const MealsGrid(),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}


