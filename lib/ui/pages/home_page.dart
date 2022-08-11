import 'package:exercise_app/data/provider/home_provider.dart';
import 'package:exercise_app/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/local_notification_service.dart';
import '../../utils/contants.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Constants {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      if (provider.state == HomeProviderState.isInit) {
        Future.delayed(Duration.zero, () {
          provider.loadData();
          provider.updatePage();
        });
      }
      return Scaffold(
        appBar: customAppBar(provider.pageIndex),
        body: provider.state == HomeProviderState.isLoading
            ? provider.currentLoadingPage(provider.pageIndex)
            : provider.currentPage(provider.pageIndex, service),
        bottomNavigationBar: bottomNavBar(provider),
        
      );
    });
  }
}
