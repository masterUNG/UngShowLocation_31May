import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ungshowlocation/utility/my_style.dart';
import 'package:ungshowlocation/widgets/show_progress.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double? lat, lng;

  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
    });
  }

  Future<Position?> findPosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  Container buildName() {
    return Container(
      decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.fingerprint,
            color: MyStyle.dart,
          ),
          labelStyle: MyStyle().h3Style(),
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
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
    return Container(
      decoration: BoxDecoration(color: Colors.white38),
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(
        decoration: InputDecoration(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: MyStyle.primary,
      ),
      body: Center(
        child: Column(
          children: [
            buildName(),
            buildUser(),
            buildPassword(),
            lat == null ? ShowProgress() : buildMap(),
          ],
        ),
      ),
    );
  }

  Expanded buildMap() => Expanded(
      child: Container(margin: EdgeInsets.all(16),
          width: double.infinity,
          color: Colors.grey,
          child: Text('lat = $lat, lng = $lng'),
        ),
  );
}
