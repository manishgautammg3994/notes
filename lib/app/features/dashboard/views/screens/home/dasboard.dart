import 'package:flutter/material.dart';
import './my_app.dart';

class  DasboardPage extends StatelessWidget {
  const DasboardPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
     theme: ThemeData(

     ),
       home: MyApp(),
     );
  }
}


