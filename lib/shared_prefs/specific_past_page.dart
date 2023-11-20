import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  ImagePage(
      {Key? key, required this.title, required this.imageTaken, required this.waterMeter})
      : super(key: key);
  String imageTaken;
  String waterMeter;
  final String title;

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? image;

  // @override
  // void initState() {
  //   //final decodedBytes = base64Decode(widget.imageTaken);
  //   final decodedBytes = base64.decode(widget.imageTaken.replaceAll(RegExp(r'\s'), ''));
  //
  //   setState(() {
  //     //image!.writeAsBytesSync(decodedBytes);
  //     print(decodedBytes);
  //   });
  // }

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
                  'Water Meter: ${widget.waterMeter}',
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Image.memory(base64Decode(widget.imageTaken)),
              ],
            ),
          )),
    );
  }
}