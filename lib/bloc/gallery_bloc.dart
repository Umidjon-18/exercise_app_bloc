import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:exercise_app/model/gallery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitial()) {
    on<GalleryLoadDataEvent>((event, emit) async{
      emit(GalleryIsLoading());
      try {
        var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
        if (response.statusCode == 200) {
          List list = jsonDecode(response.body);
          List<GalleryModel> gallery = [];
          for (var item in list) {
            gallery.add(GalleryModel.fromJson(item));
          }
          emit(GalleryIsLoaded(gallery: gallery));
        }else {
        emit(const GalleryIsError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(const GalleryIsError(errorMessage: 'Error'));
      }
    });
  }
}
