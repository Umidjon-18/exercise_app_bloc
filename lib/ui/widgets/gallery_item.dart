import 'package:flutter/material.dart';

Container galleryItem(String text) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
      ],
    ),
  );
}
