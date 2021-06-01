import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungshowlocation/model/user_model.dart';
import 'package:ungshowlocation/utility/dialog.dart';
import 'package:ungshowlocation/utility/my_style.dart';
import 'package:ungshowlocation/widgets/show_image.dart';
import 'package:ungshowlocation/widgets/show_title.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.white, MyStyle.primary],
              radius: 1.0,
              center: Alignment(0, -0.3),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildImage(),
                    buildTitle(),
                    buildUser(),
                    buildPassword(),
                    buildLogin(),
                    buildCreateAccount(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildCreateAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'Non Account ?',
          textStyle: MyStyle().h3Style(),
        ),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/createAccount'),
            child: Text(' Create Account'))
      ],
    );
  }

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyStyle.primary),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            checkAuthen(
                password: passwordController.text, user: userController.text);
          }
        },
        child: Text('Login'),
      ),
    );
  }

  Future<Null> checkAuthen({String? user, String? password}) async {
    String api =
        'https://www.androidthai.in.th/bigc/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(api).then((value) {
      print('value = $value');
      if (value.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        var result = json.decode(value.data);
        print('result = $result');
        for (var item in result) {
          print('item = $item');
          UserModel model = UserModel.fromMap(item);
          if (password == model.password) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/myService', (route) => false);
          } else {
            normalDialog(context, 'Password False',
                'Please Type Password Again ? Password False');
          }
        }
      }
    });
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill User in Blank';
          } else {
            return null;
          }
        },
        controller: userController,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            color: MyStyle.dart,
          ),
          labelStyle: MyStyle().h3Style(),
          labelText: 'User',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Password';
          } else {
            return null;
          }
        },
        controller: passwordController,
        obscureText: redEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                redEye = !redEye;
              });
            },
            icon: Icon(Icons.remove_red_eye),
          ),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle.dart,
          ),
          labelStyle: MyStyle().h3Style(),
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  ShowTitle buildTitle() {
    return ShowTitle(
      title: 'Ung Show Location ',
      textStyle: MyStyle().h1Style(),
    );
  }

  Container buildImage() {
    return Container(
      width: 250,
      child: ShowImage(),
    );
  }
}
