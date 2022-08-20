import 'package:exercise_app/utils/contants.dart';
import 'package:exercise_app/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../model/contact_model.dart';
import '../widgets/custom_textfield.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({required this.userData, Key? key}) : super(key: key);
  final ContactModel userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Constants.bottomNavBarColor,
        title: Text(
          userData.name??"Empty",
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // #user main data
              Column(
                children: [
                  // #user avatar
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff171a29),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 5),
                  // #username
                  Text(
                    userData.name??"Empty",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
        
                  const SizedBox(height: 5),
                  // #email
                  Text(
                    userData.email??"Empty",
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 147, 100, 249)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // #email field
              customTextField('E-mail', userData.email??"Empty"),
              const SizedBox(height: 20),
              // #phone number field
              customTextField('Phone number', userData.phone??"Empty"),
              const SizedBox(height: 20),
              // #website field
              customTextField('Website', userData.website??"Empty"),
              const SizedBox(height: 20),
              // #company field
              customTextField('Company', userData.company!.name??"Empty"),
              const SizedBox(height: 20),
              // #address field
              customTextField('Adress', userData.address!.street??"Empty"),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.googleMapPage, arguments: {
                  "lat": double.parse(userData.address!.geo!.lat??"0"),
                  "lng": double.parse(userData.address!.geo!.lng??"0"),
                }),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  width: 280,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                      child: Text(
                    'User Location😉',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
