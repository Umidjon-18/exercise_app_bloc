import 'package:exercise_app/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc.dart';
import '../../utils/contants.dart';
import 'checks_page.dart';
import 'contacts_page.dart';
import 'gallery_page.dart';
import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Constants {
  late PageController pageController = PageController();
  List<Widget> pages = [
    const NewsPage(),
    const GalleryPage(),
    const ChecksPage(),
    const ContactsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Constants.bgColor,
            appBar: customAppBar(state.bottomNavIndex),
            body: PageView(
              controller: pageController,
              children: pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 500), curve: Curves.easeOutSine);
                context.read<HomeBloc>().add(HomeEventChange(selectedIndex: value));
              },
              currentIndex: state.bottomNavIndex,
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
            ),
          );
        },
      ),
    );
  }
}
