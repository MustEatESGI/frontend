import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import '../core/custom_app_bar.dart';
import '../home/home_page.dart';
import '../states/order/order_cubit.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key, required this.restaurantID}) : super(key: key);

  final String restaurantID;

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchCubit>(context);
    searchBloc.getRestaurantAndMeals(restaurantID);
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        location: "/restaurant",
      ),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  searchBloc.state.restaurant!.name!,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              if(searchBloc.state.restaurant?.meals != null)
                Flexible(
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        itemBuilder: (context, index) {
                          final m = searchBloc.state.restaurant!.meals![index];
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Placeholder(
                                  fallbackHeight: 60,
                                  fallbackWidth: 60,
                                ),
                                Text(m.name!),
                                Text('${m.price!.toString()} €'),
                                IconButton(onPressed: () {
                                  context.read<OrderCubit>().addMeal(m);
                                }, icon: const Icon(Icons.add_circle))
                              ],
                            ),
                          );
                        }, itemCount: searchBloc.state.restaurant?.meals?.length,)),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GFButton(
                        onPressed: () {
                          context.read<OrderCubit>().computeTotalPrice();
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
          );
        }
      ),
    );
  }
}
