import 'package:flutter/material.dart';
import 'package:ungshowlocation/states/authen.dart';
import 'package:ungshowlocation/states/create_account.dart';
import 'package:ungshowlocation/states/my_service.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/myService': (BuildContext context) => MyService(),
};

String? keyRoute;

void main() {
  keyRoute = '/authen';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: keyRoute,
    );
  }
}
