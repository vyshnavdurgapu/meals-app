import 'package:flutter/material.dart';
import '../screens/categorymealsscreen.dart';

class categoryitem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  categoryitem(this.title, this.color, this.id);

  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(categorymealsscreen.Routename, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
