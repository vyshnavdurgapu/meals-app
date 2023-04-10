import 'package:flutter/material.dart';
import '../dummy_data.dart';

class mealdetailscreen extends StatelessWidget {
  static const routename = '/meal-detail';

  final Function togglefav;
  final Function getisfav;

  mealdetailscreen(this.togglefav, this.getisfav);

  Widget buildsectiontitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildcontainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => mealid == meal.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildsectiontitle("ingredients", context),
            buildcontainer(
              ListView.builder(
                itemCount: selectedmeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Colors.red,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedmeal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            buildsectiontitle("Steps:", context),
            buildcontainer(
              ListView.builder(
                  itemCount: selectedmeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${(index + 1)}'),
                            ),
                            title: Text(selectedmeal.steps[index]),
                          ),
                          Divider()
                        ],
                      )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          getisfav(mealid) ? Icons.star : Icons.star_border,
        ),
        // onPressed: () => Navigator.of(context).pop(mealid),
        onPressed: () => togglefav(mealid),
      ),
    );
  }
}
