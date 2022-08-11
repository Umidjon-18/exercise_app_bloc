import 'package:flutter/material.dart';

import 'check_item.dart';

SafeArea checkWidget(List<dynamic> check) {
  return SafeArea(
      child: Container(
    color: Colors.black,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: check.length,
      itemBuilder: (BuildContext context, int index) {
        return checkItem(check[index]['title']);
      },
    ),
  ));
}
