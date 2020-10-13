import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:userapp/src/Services/Connection.service.dart';
import 'package:userapp/src/models/User/User.model.dart';

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  MapboxMapController _mapController;

  @override
  void initState() {
    super.initState();
  }

  final estiloTitulo = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(2.923257480900304, -75.28859894430114),
    zoom: 14.0,
  );
  bool _compassEnabled = false;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  String _styleString = MapboxStyles.MAPBOX_STREETS;
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomGesturesEnabled = true;
  bool _myLocationEnabled = true;
  User _model;
  Map _arguments;
  MyLocationTrackingMode _myLocationTrackingMode =
      MyLocationTrackingMode.Tracking;

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  void _setModel() {
    try {
      _model = _arguments['model'];
      _mapController.addSymbol(
        SymbolOptions(
            iconSize: 0.1,
            geometry: LatLng(
              _model?.address?.geo?.lat,
              _model?.address?.geo?.lng,
            ),
            iconImage: 'assets/images/download.png'),
      );
      _mapController.moveCamera(
        CameraUpdate.newLatLng(
          LatLng(
            _model?.address?.geo?.lat,
            _model?.address?.geo?.lng,
          ),
        ),
      );
    } catch (e) {
      Timer(Duration(milliseconds: 500), () {
        _setModel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_model == null && _arguments == null) {
      _arguments = ModalRoute.of(context).settings.arguments;
      if (_arguments.containsKey('model')) {
        _setModel();
      }
    }
    return new Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            accessToken: Connection.mapboxToken,
            onMapCreated: _onMapCreated,
            initialCameraPosition: _kInitialPosition,
            trackCameraPosition: true,
            compassEnabled: _compassEnabled,
            cameraTargetBounds: _cameraTargetBounds,
            minMaxZoomPreference: _minMaxZoomPreference,
            styleString: _styleString,
            rotateGesturesEnabled: _rotateGesturesEnabled,
            scrollGesturesEnabled: _scrollGesturesEnabled,
            tiltGesturesEnabled: _tiltGesturesEnabled,
            zoomGesturesEnabled: _zoomGesturesEnabled,
            myLocationEnabled: _myLocationEnabled,
            myLocationTrackingMode: _myLocationTrackingMode,
            myLocationRenderMode: MyLocationRenderMode.GPS,
            onCameraTrackingDismissed: () {
              this.setState(() {
                _myLocationTrackingMode = MyLocationTrackingMode.None;
              });
            },
          ),
          _buttons(),
        ],
      ),
    );
  }

  Widget _buttons() => Container(
        child: Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                  color: Colors.black,
                ),
                onPressed: () async {
                  Position position = await getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  _mapController.animateCamera(
                    CameraUpdate.newLatLng(
                      LatLng(
                        position.latitude,
                        position.longitude,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
