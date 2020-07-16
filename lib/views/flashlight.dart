import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter/widgets.dart';


class FlashLight extends StatefulWidget {
  @override
  _FlashLightState createState() => _FlashLightState();
}

class _FlashLightState extends State<FlashLight> {
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child : Container(
//          decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage("images/conan.jpg"), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: ClipRRect(borderRadius: BorderRadius.circular(60.0),
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Colors.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(_hasFlashlight
                            ? 'FlashLight is ready'
                            : 'Your phone has no Flashlight.' , style: TextStyle(color: Colors.blue ,fontSize: 25, fontStyle: FontStyle.italic) ,),
                        RaisedButton(
                          color: Colors.green,
                          child: Text('Turn on', style: TextStyle(color: Colors.white),),
                          onPressed: () => Flashlight.lightOn(),
                        ),
                        RaisedButton(
                          color: Colors.redAccent,
                          child: Text('Turn off' , style: TextStyle(color: Colors.white),),
                          onPressed: () => Flashlight.lightOff(),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}