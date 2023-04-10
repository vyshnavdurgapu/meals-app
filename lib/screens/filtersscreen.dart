import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';

class filtersscreen extends StatefulWidget {
  static String routename = 'filtersscreen';

  Function savefilters;
  final Map<String, bool> currentfilters;
  filtersscreen(this.currentfilters, this.savefilters);

  @override
  State<filtersscreen> createState() => _filtersscreenState();
}

class _filtersscreenState extends State<filtersscreen> {
  bool glutenfree = false;
  bool vegeterian = false;
  bool vegan = false;
  bool lactosefree = false;

  initState() {
    glutenfree = widget.currentfilters['gluten'];
    vegeterian = widget.currentfilters['vegeterian'];
    vegan = widget.currentfilters['vegan'];
    lactosefree = widget.currentfilters['lactose'];
    super.initState();
  }

  Widget buildswitchlisttile(
      String title, String subtitle, bool currentvalue, Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      subtitle: Text(subtitle),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectedfilters = {
                    'gluten': glutenfree,
                    'lactose': lactosefree,
                    'vegan': vegan,
                    'vegeterian': vegeterian,
                  };
                  widget.savefilters(selectedfilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: maindrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "em ra balaraju em kavili ra niku.....",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildswitchlisttile(
                    'Gluten-Free',
                    'display only GlutenFree meals',
                    glutenfree,
                    (newvalue) {
                      setState(() {
                        glutenfree = newvalue;
                      });
                    },
                  ),
                  buildswitchlisttile(
                    'lactose-Free',
                    'display only lactosefree meals',
                    lactosefree,
                    (newvalue) {
                      setState(() {
                        lactosefree = newvalue;
                      });
                    },
                  ),
                  buildswitchlisttile(
                    'Vegeterian',
                    'display only vegeterian meals',
                    vegeterian,
                    (newvalue) {
                      setState(() {
                        vegeterian = newvalue;
                      });
                    },
                  ),
                  buildswitchlisttile(
                    'vegan',
                    'display only vegan meals',
                    vegan,
                    (newvalue) {
                      setState(() {
                        vegan = newvalue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
