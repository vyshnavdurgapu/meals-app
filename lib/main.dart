import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import './screens/mealdetailscreeen.dart';
import './screens/tabs_screen.dart';
import 'screens/category_screen.dart';
import 'screens/categorymealsscreen.dart';
import 'screens/filtersscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<meal> favoritemeals = [];

  List<meal> availablemeals = DUMMY_MEALS;

  void setfilters(Map<String, bool> filterdata) {
    setState(() {
      filters = filterdata;
      print('before if');
      availablemeals = DUMMY_MEALS.where((ele) {
        if (filters['gluten'] && (!ele.isGlutenFree)) {
          return false;
        }
        if (filters['lactose'] && (!ele.isLactoseFree)) {
          return false;
        }
        if (filters['vegan'] && (!ele.isVegan)) {
          return false;
        }
        if (filters['vegeterian'] && (!ele.isVegetarian)) {
          return false;
        }
        return true;
        // print('here');
      }).toList();
      print('before if');
    });
  }

  void togglefavorite(String mealid) {
    final existingindex = favoritemeals.indexWhere((m) => m.id == mealid);
    if (existingindex >= 0) {
      setState(() {
        favoritemeals.removeAt(existingindex);
      });
    } else {
      setState(() {
        favoritemeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  bool ismealfav(String id) {
    return favoritemeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.red,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.red),
              bodyText2: TextStyle(color: Colors.red),
              headline1: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => tabs_screen(favoritemeals),
        categorymealsscreen.Routename: (ctx) =>
            categorymealsscreen(availablemeals),
        mealdetailscreen.routename: (ctx) =>
            mealdetailscreen(togglefavorite, ismealfav),
        filtersscreen.routename: (ctx) => filtersscreen(filters, setfilters),
      },
      onUnknownRoute: (settings) {
        MaterialPageRoute(builder: (ctx) => categories_screen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
