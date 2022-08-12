import 'package:flutter/material.dart';

Container contactItem(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    padding: const EdgeInsets.all(5),
    child: ListTile(
      leading: const Icon(Icons.person, color: Colors.grey,),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}
