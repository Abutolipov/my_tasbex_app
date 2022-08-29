import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/base.dart';
import 'models/extra.dart';


void main(){
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
   return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MyApp(),
       routes: {
       DeterminatePage.id: (context) => DeterminatePage(),
       },
    );
  }
}




