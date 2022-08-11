import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget checkLoadingWidget() {
  return Container(
    color: Colors.blueGrey[900],
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
                itemBuilder: (_, __) => ListTile(
                  leading: Checkbox(
                    onChanged: ((value) {}),
                    value: false,
                  ),
                  title: Container(
                    color: Colors.white,
                    height: 20,
                  ),
                ),
                itemCount: 20,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
