import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc.dart';
import '../../utils/contants.dart';
import '../../utils/routes.dart';
import '../widgets/contact_item.dart';
import '../widgets/loading_widgets/contact_loading.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Constants.bgColor,
      body: BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
      if (state is ContactInitial) {
        context.read<ContactBloc>().add(ContactLoadDataEvent());
        return const SizedBox.shrink();
      } else if (state is  ContactIsLoading) {
        return contactLoadingWidget();
      } else if (state is  ContactIsLoaded) {
        return SafeArea(
      child: Container(
    color: Constants.bgColor,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: state.contact.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.contactPage, arguments: {
            'userData': state.contact[index],
          }),
          child: contactItem(state.contact[index].name));
      },
    ),
  ));
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    })
  ,
    );
  }
}
