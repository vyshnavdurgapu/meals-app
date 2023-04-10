import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class favoritesscreen extends StatelessWidget {
  final List<meal> favoritesmeals;

  favoritesscreen(this.favoritesmeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesmeals.isEmpty) {
      return Center(child: Text('em ra bhai nik em istam o nak em telusu'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return mealitem(
            id: favoritesmeals[index].id,
            title: favoritesmeals[index].title,
            imageurl: favoritesmeals[index].imageUrl,
            duration: favoritesmeals[index].duration,
            affordability: favoritesmeals[index].affordability,
            complexity: favoritesmeals[index].complexity,
          );
        },
        itemCount: favoritesmeals.length,
      );
    }
  }
}
