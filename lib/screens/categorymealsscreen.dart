import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class categorymealsscreen extends StatefulWidget {
  static String Routename = '/category-meals';
  final List<meal> availablemeals;
  categorymealsscreen(this.availablemeals);
  @override
  State<categorymealsscreen> createState() => _categorymealsscreenState();
}

class _categorymealsscreenState extends State<categorymealsscreen> {
  String categorytitle;
  List<meal> categorymeals;
  bool loadedinitdata = false;

  void didChangeDependencies() {
    if (!loadedinitdata) {
      print('hereincat?');
      final routeargs = ModalRoute.of(context).settings.arguments as Map;
      categorytitle = routeargs['title'];
      final categoryid = routeargs['id'];
      categorymeals = widget.availablemeals.where((m) {
        return m.categories.contains(categoryid);
      }).toList();
      loadedinitdata = true;
    }

    super.didChangeDependencies();
  }

  void initState() {
    super.initState();
  }

  // final String categoryId;
  void removemeal(String mealid) {
    setState(() {
      categorymeals.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return mealitem(
            id: categorymeals[index].id,
            title: categorymeals[index].title,
            imageurl: categorymeals[index].imageUrl,
            duration: categorymeals[index].duration,
            affordability: categorymeals[index].affordability,
            complexity: categorymeals[index].complexity,
            // removeitem: removemeal,
          );
        },
        itemCount: categorymeals.length,
      ),
    );
  }
}
