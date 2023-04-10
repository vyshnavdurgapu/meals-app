import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';
import './favoritesscreen.dart';
import './category_screen.dart';
import '../models/meal.dart';

class tabs_screen extends StatefulWidget {
  final List<meal> favoritemeals;
  tabs_screen(this.favoritemeals);

  @override
  State<tabs_screen> createState() => _tabs_screenState();
}

class _tabs_screenState extends State<tabs_screen> {
  List<Map<String, Object>> pages;

  void initState() {
    pages = [
      {'page': categories_screen(), 'title': "ch00se ur MeUal"},
      {'page': favoritesscreen(widget.favoritemeals), 'title': "Favorites"},
    ];
    super.initState();
  }

  int selectedpageindex = 0;

  void selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedpageindex]['title']),
      ),
      drawer: maindrawer(),
      body: pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        currentIndex: selectedpageindex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('categories')),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('favorites'),
          ),
        ],
      ),
    );
  }
}
