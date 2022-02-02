import  'package:flutter/material.dart';

class InitialLandingPage extends StatefulWidget {
  const InitialLandingPage({ Key? key}) : super(key: key);

  @override
  _InitialLandingPageState createState() => _InitialLandingPageState();
}

class _InitialLandingPageState extends State<InitialLandingPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFFdbe8f7),
      body: Container(
        child:Column(
          children: [
            Image.asset("asset/House.gif"),



          ],
        ),
      ),
     




    );
  }
}