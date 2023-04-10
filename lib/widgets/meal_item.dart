import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/mealdetailscreeen.dart';
import '../models/meal.dart';

class mealitem extends StatelessWidget {
  @override
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeitem;
  mealitem({
    @required this.id,
    @required this.title,
    @required this.imageurl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
    // @required this.removeitem,
  });

  String get Complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
        break;
    }
  }

  String get Affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      mealdetailscreen.routename,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeitem(result);ll
      }
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(Complexitytext),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(Affordabilitytext),
                    ],
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
