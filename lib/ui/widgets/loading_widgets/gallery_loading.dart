import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget galleryLoadingWidget() {
  return Container(
    color: Colors.blueGrey[900],
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Column(
      children: [
        Expanded(
          child: SizedBox(
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: const Color.fromARGB(255, 84, 44, 230),
              enabled: true,
              child: GridView.builder(
                itemBuilder: (_, __) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 1,
                    crossAxisCount: 2),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
