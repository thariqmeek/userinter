import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:userinter/Gridbox.dart';
import 'package:userinter/Login.dart';
import 'package:userinter/UserForm.dart';
import 'package:userinter/crud.dart';
import 'package:userinter/textfield.dart';
import 'package:userinter/webcredentials.dart';

import 'InitialLandingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb ? dbweb : null,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('HI'),
          ),
          body: const crud()),
    );
  }
}
