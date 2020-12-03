import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    await Firebase.initializeApp();
    Navigator.pushNamed(context, 'loginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }
}
