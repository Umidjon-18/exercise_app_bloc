import 'dart:math';

import 'package:exercise_app/utils/contants.dart';
import 'package:flutter/material.dart';

class GalleriesPage extends StatelessWidget {
  const GalleriesPage({required this.pageTitle, Key? key}) : super(key: key);
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.white,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.lime,
      Colors.orange,
      Colors.amberAccent,
      Colors.deepOrangeAccent,
      Colors.teal,
      Colors.tealAccent
    ];
    return Scaffold(
            backgroundColor: Constants.bgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Constants.bottomNavBarColor,
        title: Text(
          pageTitle,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.blueGrey[900],
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 100,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: colors[Random.secure().nextInt(colors.length)],
            );
          },
        ),
      ),
    );
  }
}
