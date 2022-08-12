import 'dart:math';

import 'package:flutter/material.dart';

Container checkItem(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    child: ListTile(
      leading: Theme(
        data: ThemeData(
      primarySwatch: Colors.grey,
      unselectedWidgetColor: const Color(0xff8179aa),
    ),
        child: Checkbox(
            activeColor: const Color(0xff8179aa),
          onChanged: ((value) {}),
          value: Random.secure().nextBool(),
        ),
      ),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}
