import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/core/injection.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import '../core/custom_app_bar.dart';
import '../home/home_page.dart';
import '../states/order/order_cubit.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key, required this.restaurantID}) : super(key: key);

  final String restaurantID;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SearchCubit, SearchState>(builder: (context, stateSearch) {
      if(stateSearch.restaurant == null) {
        return Scaffold(
        appBar: CustomAppBar(
          context: context,
          location: "/restaurant",
        ),
        body: const Center(child: CircularProgressIndicator()),);
      }
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
                      stateSearch.restaurant!.name!,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  if(stateSearch.restaurant?.meals != null)
                    Flexible(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          itemBuilder: (context, index) {
                            final m = stateSearch.restaurant!.meals![index];
                            return Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(m.picture!, fit: BoxFit.cover,)),
                                  SizedBox(
                                      width: 100,
                                      child: Text(m.name!)),
                                  SizedBox(
                                    width: 100,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(convertPrice(m.price),),
                                        ],
                                      )),
                                  Flexible(child: IconButton(onPressed: () {
                                    context.read<OrderCubit>().addMeal(m);
                                  }, icon: const Icon(Icons.add_circle))),
                                ],
                              ),
                            );
                          }, itemCount: stateSearch.restaurant?.meals?.length,)),
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
    }, listener: (context, state){});
  }
}
