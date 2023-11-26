import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WaterDailyPage extends StatefulWidget {
  WaterDailyPage(
      {Key? key, required this.title, required this.waterDaily})
      : super(key: key);
  String waterDaily;
  final String title;

  @override
  _WaterDailyPageState createState() => _WaterDailyPageState();
}

class _WaterDailyPageState extends State<WaterDailyPage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(
                  'Water Daily Intake: ${widget.waterDaily}',
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                int.parse(widget.waterDaily) > 27
                  ? Image.network("https://ih1.redbubble.net/image.4630650292.3974/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.u3.jpg")
                    : Image.network("https://images.squarespace-cdn.com/content/51da6ef1e4b01c133f38e2e7/1468296308941-D6BYSETGHK9BFGVL0BTY/?content-type=image%2Fjpeg")
              ],
            ),
          )),
    );
  }
}