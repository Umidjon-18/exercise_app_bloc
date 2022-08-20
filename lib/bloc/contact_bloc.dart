
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../model/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<ContactLoadDataEvent>((event, emit) async{
      emit(ContactIsLoading());
      try {
        var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
        if (response.statusCode == 200) {
          List list = jsonDecode(response.body);
          List<ContactModel> contact = [];
          for (var item in list) {
            contact.add(ContactModel.fromJson(item));
          }
          emit(ContactIsLoaded(contact: contact));
        }else {
        emit(const ContactIsError(errorMessage: "Something went wrong"));
        }
      } catch (e) {
        emit(const ContactIsError(errorMessage: 'Error'));
      }
    });
  }
}
