import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  FirebaseRemoteConfig? firebaseRemoteConfig;
  String title = "StudentsList";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRemoteConfig();
  }

  Future<void> fetchRemoteConfig() async {
    try {
      firebaseRemoteConfig = FirebaseRemoteConfig.instance;
      await firebaseRemoteConfig?.setDefaults(<String,dynamic> {
        'title' : "StudentsList"
      });

      await firebaseRemoteConfig?.fetchAndActivate();

      setState(() {

        title = firebaseRemoteConfig?.getString('title') ?? '';

      });

    }catch(e) {
      print('failed to Fetch RemoteConfig $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context , snapshots) {

            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshots.hasError) {
              return Center(child: Text("Error : ${snapshots.error}"));
            }

            if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
              return const Center(child: Text("No Data Available"),);
            }

            final List<DocumentSnapshot> documents = snapshots.data!.docs;

            return ListView(
              children: documents.map((doc) {
                return ListTile(
                    title : Text(doc['name']),
                    subtitle : Text(doc['mobileNumber'])
                );
              }).toList()
            );
          },
        ),
      ),
    );
  }
}
