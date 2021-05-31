import 'package:flutter/material.dart';
import 'package:ungshowlocation/utility/my_style.dart';

class ShowTitle extends StatelessWidget {
  String? title;

  ShowTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title!, style: MyStyle().h1Style(),);
  }
}
