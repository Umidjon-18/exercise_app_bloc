import 'dart:async';

import 'package:exercise_app/ui/widgets/check_widget.dart';
import 'package:exercise_app/ui/widgets/contact_widget.dart';
import 'package:exercise_app/ui/widgets/gallery_widget.dart';
import 'package:exercise_app/ui/widgets/news_widget.dart';
import 'package:flutter/material.dart';

import '../../services/network_service.dart';
import '../../ui/widgets/loading_widgets/check_loading.dart';
import '../../ui/widgets/loading_widgets/contact_loading.dart';
import '../../ui/widgets/loading_widgets/gallery_loading.dart';
import '../../ui/widgets/loading_widgets/news_loading.dart';

enum HomeProviderState {
  isInit,
  isLoading,
  isDone,
  isError,
}

class HomeProvider extends ChangeNotifier {
  List<dynamic> posts = [];
  List<dynamic> gallery = [];
  List<dynamic> check = [];
  List<dynamic> contacts = [];
  List<dynamic> comments = [];
  HomeProviderState state = HomeProviderState.isInit;
  int pageIndex = 0;

  changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }

  loadData() async {
    state = HomeProviderState.isLoading;
    notifyListeners();
    posts = await Network().getData('posts');
    gallery = await Network().getData('albums');
    check = await Network().getData('todos');
    contacts = await Network().getData('users');
    comments = await Network().getData('comments');
    state = HomeProviderState.isDone;
    notifyListeners();
  }

  currentPage(int index) {
    switch (index) {
      case 0:
        return newsWidget(posts, comments);
      case 1:
        return galleryWidget(gallery);
      case 2:
        return checkWidget(check);
      case 3:
        return contactWidget(contacts);
      default:
    }
  }

  currentLoadingPage(int index) {
    switch (index) {
      case 0:
        return newsLoadingWidget();
      case 1:
        return galleryLoadingWidget();
      case 2:
        return checkLoadingWidget();
      case 3:
        return contactLoadingWidget();
      default:
    }
  }

  updatePage() {
    state = HomeProviderState.isLoading;
    notifyListeners();
    Timer(const Duration(milliseconds: 600), () {
      state = HomeProviderState.isDone;
      notifyListeners();
    });
  }
}
