import 'package:flutter/material.dart';
import 'package:ungshowlocation/utility/my_style.dart';
import 'package:ungshowlocation/widgets/show_image.dart';
import 'package:ungshowlocation/widgets/show_title.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: ListTile(
        leading: ShowImage(),
        title: ShowTitle(title: title, textStyle: MyStyle().h1Style(),),
        subtitle: ShowTitle(title: message, textStyle: MyStyle().h2Style(),),
      ),actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'),),],
    ),
  );
}
