import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget newsLoadingWidget() {
  return Container(
    color: Colors.blueGrey[900],
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
                itemCount: 6,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
