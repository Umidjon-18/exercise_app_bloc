
import 'package:exercise_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/check_bloc.dart';
import 'bloc/contact_bloc.dart';
import 'bloc/gallery_bloc.dart';
import 'bloc/news_bloc.dart';
import 'bloc/news_item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>NewsBloc()),
        BlocProvider(create: (BuildContext context)=>GalleryBloc()),
        BlocProvider(create: (BuildContext context)=>CheckBloc()),
        BlocProvider(create: (BuildContext context)=>ContactBloc()),
        BlocProvider(create: (BuildContext context)=>NewsItemBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => Routes.generateRoute(settings),
      ),
    );
  }
}
