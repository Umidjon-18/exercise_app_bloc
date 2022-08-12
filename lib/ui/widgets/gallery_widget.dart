import 'package:exercise_app/utils/contants.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';
import 'gallery_item.dart';

SafeArea galleryWidget(List<dynamic> gallery) {
  return SafeArea(
      child: Container(
    padding: const EdgeInsets.all(10),
    color: Constants.bgColor,
    child: GridView.builder(
      itemCount: gallery.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.galleryPage, arguments: {
            'pageTitle': gallery[index]['title'],
          }),
          child: galleryItem(gallery[index]['title']),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
          crossAxisCount: 2),
    ),
  ));
}
