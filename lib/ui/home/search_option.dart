
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';



class SearchOption extends StatefulWidget {
  const SearchOption({Key? key, required this.onFiltersChanged})
      : super(key: key);

  final Function(List<String>) onFiltersChanged;

  @override
  State<SearchOption> createState() => _SearchOptionState();
}

class _SearchOptionState extends State<SearchOption> {
  Map<String, bool> values = {'distance': false, 'price': false};

  void onFilterChanged(){
    final isDistance = values['distance'] == true;
    final isPrice = values['price'] == true;
    final isRatio = (isPrice && isDistance) || (!isPrice && !isDistance);
    if(isRatio){
      widget.onFiltersChanged(['ratio']);
    }
    if(isPrice){
      widget.onFiltersChanged(['price']);
    }
    if(isDistance){
      widget.onFiltersChanged(['distance']);
    }
  }

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
                onFilterChanged();
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
                onFilterChanged();
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
