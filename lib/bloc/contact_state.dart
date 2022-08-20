part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

}

class ContactInitial extends ContactState {
  @override
  List<Object?> get props => [];
}



class ContactIsLoading extends ContactState {
  @override
  List<Object?> get props => [];
}

class ContactIsLoaded extends ContactState {
  const ContactIsLoaded({required this.contact});
  final List<ContactModel> contact;
  @override
  List<Object?> get props => [contact];
}

class ContactIsError extends ContactState {
  const ContactIsError({required this.errorMessage});
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}