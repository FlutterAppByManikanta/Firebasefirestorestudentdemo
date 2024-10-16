import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registeration Form"),),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter Student Name"),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: "Enter Student Age"),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: "Enter Student MobileNumber"),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Enter Student Email"),
              ),
            ),
          ),

          SizedBox(height: 10,),



        ],
      ),
    );
  }
}
