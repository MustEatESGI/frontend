import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

import '../../models/restaurant.dart';

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

class CustomAppBar extends AppBar {
  CustomAppBar(
      {Key? key, required BuildContext context, required String location})
      : super(
          key: key,
          toolbarHeight: 70,
          actions: [
            IconButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
                icon: const Icon(Icons.home)),
            IconButton(
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  GoRouter.of(context).go('/cart');
                },
                icon: const Icon(Icons.shopping_cart_rounded)),
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

class MealsGrid extends StatelessWidget {
  const MealsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 18,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            final item = state.meals![index];
            return MealCard(
              index: index,
              name: item.name!,
              deliveryTime: '0 min',
              price: item.price.toString(),
              posterURL: item.imageUrl!,
            );
          });
    });
  }
}

class SearchOption extends StatefulWidget {
  const SearchOption({Key? key, required this.onFiltersChanged})
      : super(key: key);

  final Function(List<String>) onFiltersChanged;

  @override
  State<SearchOption> createState() => _SearchOptionState();
}

class _SearchOptionState extends State<SearchOption> {
  Map<String, bool> values = {'distance': false, 'price': false};

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GFCheckbox(
              size: GFSize.SMALL,
              activeBgColor: GFColors.INFO,
              type: GFCheckboxType.circle,
              onChanged: (isChecked) {
                setState(() {
                  values['distance'] = isChecked;
                });
              },
              value: values['distance']!,
              inactiveIcon: null,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Distance',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            GFCheckbox(
              size: GFSize.SMALL,
              activeBgColor: GFColors.INFO,
              type: GFCheckboxType.circle,
              onChanged: (isChecked) {
                setState(() {
                  values['price'] = isChecked;
                });
              },
              value: values['price']!,
              inactiveIcon: null,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Prix',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.index,
    required this.restaurant,
  }) : super(key: key);

  final int index;
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          print('on click meal $index');
        },
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Flexible(
                  flex: 4,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      restaurant.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )),
              Flexible(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name!,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(restaurant.distance!),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.index,
    required this.name,
    required this.deliveryTime,
    required this.price,
    required this.posterURL,
  }) : super(key: key);

  final int index;
  final String name;
  final String deliveryTime;
  final String price;
  final String posterURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          print('on click meal $index');
          print('A');

          context.go('/restaurant/1');
        },
        child: Stack(
          children: [
            Card(
              elevation: 8,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Flexible(
                      flex: 4,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          posterURL,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Flexible(
                      child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(deliveryTime),
                          Text(
                            price,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
