import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/contants.dart';

Widget contactLoadingWidget() {
  return Container(
    color: Colors.blueGrey[900],
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: const Color.fromARGB(255, 84, 44, 230),
              enabled: true,
              child: ListView.builder(
                itemBuilder: (_, __) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: const EdgeInsets.all(5),
                  color: Constants.bottomNavBarColor,
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Container(
                      color: Colors.white,
                      height: 20,
                    ),
                  ),
                ),
                itemCount: 15,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
