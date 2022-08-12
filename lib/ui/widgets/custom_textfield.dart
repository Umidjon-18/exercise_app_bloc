import 'package:flutter/material.dart';

Container customTextField(String labelName, String value) {
  TextEditingController textEditingController = TextEditingController()
    ..text = value;
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: TextField(
      readOnly: true,
      style: const TextStyle(color: Colors.white),
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff807b9c), width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff807b9c), width: 1),
        ),
        label: Text(labelName),
        labelStyle: const TextStyle(
          color: Color(0xff807b9c),
        ),
      ),
    ),
  );
}
