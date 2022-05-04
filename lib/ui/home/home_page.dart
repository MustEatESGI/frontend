import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:must_eat_gui/ui/states/search/search_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Rechercher un repas",
                                border: OutlineInputBorder()),
                            onChanged: context.read<SearchCubit>().getByMeal,
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SearchOption(
                      onFiltersChanged: (List<String> filters) {},
                    ),
                  ],
                ),
                Flexible(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return MealCard(
                          index: index,
                          name: 'Burger',
                          deliveryTime: '0 min',
                          price: '15 E',
                          posterURL: 'https://picsum.photos/200/300',
                        );
                      }),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
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
            const Text('Distance')
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
            const Text('Prix')
          ],
        ),
      ],
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
    return GestureDetector(
      onTap: () {
        print('on click meal $index');
      },
      child: Stack(
        children: [
          Card(
            elevation: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Flexible(
                    flex: 8,
                    child: Container(
                      child: Image.network('https://picsum.photos/900/800', fit: BoxFit.cover,),
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
                          style: const TextStyle(color: Colors.black, fontSize: 16),
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
    );
  }
}
