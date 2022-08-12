import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/routes.dart';
import 'contact_item.dart';

SafeArea contactWidget(List<dynamic> contacts) {
  return SafeArea(
      child: Container(
    color: Constants.bgColor,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.contactPage, arguments: {
            'userData': contacts[index],
          }),
          child: contactItem(contacts[index]['name']),
        );
      },
    ),
  ));
}
