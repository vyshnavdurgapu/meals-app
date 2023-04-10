import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/categoryitem.dart';

class categories_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((catdata) {
        return categoryitem(
          catdata.title,
          catdata.color,
          catdata.id,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
    );
  }
}
