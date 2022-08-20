import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/gallery_bloc.dart';
import '../../utils/routes.dart';
import '../widgets/gallery_item.dart';
import '../widgets/loading_widgets/gallery_loading.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
      if (state is GalleryInitial) {
        context.read<GalleryBloc>().add(GalleryLoadDataEvent());
        return const SizedBox.shrink();
      } else if (state is GalleryIsLoading) {
        return galleryLoadingWidget();
      } else if (state is GalleryIsLoaded) {
        return SafeArea(
            child: Container(
          color: Colors.black,
          child: GridView.builder(
      itemCount: state.gallery.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.galleryPage, arguments: {
            'pageTitle': state.gallery[index].title,
          }),
          child: galleryItem(state.gallery[index].title),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
          crossAxisCount: 2),
    ),
        ));
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  
  }
}