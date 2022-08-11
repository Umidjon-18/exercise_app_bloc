import 'package:flutter/material.dart';

import '../../utils/contants.dart';

AppBar customAppBar(int pageIndex) {
  return AppBar(
        elevation: 0,
    centerTitle: true,
    backgroundColor: Constants.bottomNavBarColor,
    title: Text(
      Constants.appBars[pageIndex],
      style: const TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
