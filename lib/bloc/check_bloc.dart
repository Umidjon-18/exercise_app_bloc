import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../model/check_model.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckInitial()) {
    on<CheckLoadDataEvent>((event, emit) async{
      emit(CheckIsLoading());
      try {
        var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
        if (response.statusCode == 200) {
          List list = jsonDecode(response.body);
          List<CheckModel> check = [];
          for (var item in list) {
            check.add(CheckModel.fromJson(item));
          }
          emit(CheckIsLoaded(check: check));
        }else {
        emit(const CheckIsError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(const CheckIsError(errorMessage: 'Error'));
      }
    });
  }
}
