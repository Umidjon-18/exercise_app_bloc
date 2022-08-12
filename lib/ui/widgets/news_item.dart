import 'package:flutter/material.dart';

import '../../utils/contants.dart';

Container newsItem(String title, String body) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    decoration: BoxDecoration(
        color: Constants.newsItemContainerColor,
        borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          body,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  );
}
