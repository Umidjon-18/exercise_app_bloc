import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/contants.dart';

Container checkItem(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    color: Constants.bottomNavBarColor,
    child: ListTile(
      leading: Checkbox(
        onChanged: ((value) {}),
        value: Random.secure().nextBool(),
      ),
      title: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}
