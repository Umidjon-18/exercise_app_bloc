part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

}

class ContactLoadDataEvent extends ContactEvent {
  @override
  List<Object?> get props => [];
}