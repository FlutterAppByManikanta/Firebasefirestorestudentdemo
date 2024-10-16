import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employeedemoapp/model/Student.dart';
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

  Future<void> addStudentDataIntoFireStore(Student student) async {
    CollectionReference studentReference =
        FirebaseFirestore.instance.collection('students');
    return studentReference
        .add(student.toMap())
        .then((value) => print("Student is Succesfully Added"))
        .catchError((error) => print("Student Data is Not Inserted $error"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Registeration Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: nameController,
                    decoration:
                        InputDecoration(labelText: "Enter Student Name"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: "Enter Student Age"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: mobileNumberController,
                    decoration: InputDecoration(
                        labelText: "Enter Student MobileNumber"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: emailController,
                    decoration:
                        InputDecoration(labelText: "Enter Student Email"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        mobileNumber: mobileNumberController.text,
                        email: emailController.text);
                    addStudentDataIntoFireStore(student);
                    print("Student is Addedd Succesfully");

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(left: 25, right: 25),
                    height: 60,
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
