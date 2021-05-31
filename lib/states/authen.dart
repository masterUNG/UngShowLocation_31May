import 'package:flutter/material.dart';
import 'package:ungshowlocation/widgets/show_image.dart';
import 'package:ungshowlocation/widgets/show_title.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildImage(),
          ShowTitle(title: 'Ung Show Location'),
        ],
      ),
    );
  }

  Container buildImage() {
    return Container(
      width: 250,
      child: ShowImage(),
    );
  }
}
