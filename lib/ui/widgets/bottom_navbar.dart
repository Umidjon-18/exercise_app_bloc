import 'package:flutter/material.dart';

import '../../utils/contants.dart';

BottomNavigationBar bottomNavBar(provider) {
  return BottomNavigationBar(
    onTap: (value) {
      provider.updatePage();
      provider.changePage(value);
    },
    currentIndex: provider.pageIndex,
    unselectedItemColor: Constants.unselectedBotNavBarItemColor,
    items: const [
      BottomNavigationBarItem(
        backgroundColor: Constants.bottomNavBarColor,
        icon: Icon(
          Icons.home,
        ),
        label: 'News',
      ),
      BottomNavigationBarItem(
        backgroundColor: Constants.bottomNavBarColor,
        icon: Icon(Icons.note),
        label: 'Gallery',
      ),
      BottomNavigationBarItem(
        backgroundColor: Constants.bottomNavBarColor,
        icon: Icon(Icons.favorite_outline),
        label: 'Check',
      ),
      BottomNavigationBarItem(
        backgroundColor: Constants.bottomNavBarColor,
        icon: Icon(Icons.import_contacts_sharp),
        label: 'Contacts',
      ),
    ],
  );
}
