import 'package:flutter/material.dart';
import 'package:ungshowlocation/utility/my_style.dart';
import 'package:ungshowlocation/widgets/show_image.dart';
import 'package:ungshowlocation/widgets/show_title.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;

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
        onPressed: () {},
        child: Text('Login'),
      ),
    );
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
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
    return Container(decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
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