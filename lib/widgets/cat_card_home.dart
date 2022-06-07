import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../models/cat_model.dart';

class CatCardHome extends StatelessWidget {
  const CatCardHome({
    Key? key,
    required this.size,
    required this.catInfo,
  }) : super(key: key);

  final Size size;
  final Cat catInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  catInfo.name!,
                  style: TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).go('/itemBuilder', extra: catInfo);
                    final query = catInfo;
                  },
                  child: Text(
                    'Ver más...',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                catInfo.imageCat!.url!,
                fit: BoxFit.fitWidth,
              ),
              // child: Image.network(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  catInfo.origin!,
                  style: TextStyle(fontSize: 20),
                ),
                Column(
                  children: [
                    Text(
                      'Intelligence',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    RatingBarIndicator(
                      rating: catInfo.intelligence!.toDouble(),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
