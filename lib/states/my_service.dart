import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ungshowlocation/model/user_model.dart';
import 'package:ungshowlocation/utility/my_style.dart';
import 'package:ungshowlocation/widgets/show_progress.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  List<UserModel> userModels = [];
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  void addMarker(LatLng latLng, String idMarker, String title) {
    MarkerId markerId = MarkerId(idMarker);
    Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      infoWindow: InfoWindow(title: title),
    );
    markers[markerId] = marker;
  }

  Future<Null> readAllData() async {
    String api = 'https://www.androidthai.in.th/bigc/getAllUser.php';
    await Dio().get(api).then((value) {
      for (var item in json.decode(value.data)) {
        UserModel userModel = UserModel.fromMap(item);

        addMarker(
          LatLng(double.parse(userModel.lat), double.parse(userModel.lng)),
          'id${userModel.id}',
          userModel.name,
        );

        setState(() {
          userModels.add(userModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        backgroundColor: MyStyle.primary,
      ),
      body: userModels.length == 0 ? ShowProgress() : buildMap(),
    );
  }

  Widget buildMap() => GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            double.parse(userModels[0].lat),
            double.parse(userModels[0].lng),
          ),
          zoom: 16,
        ),
        onMapCreated: (controller) {},
        markers: Set<Marker>.of(markers.values),
      );
}
