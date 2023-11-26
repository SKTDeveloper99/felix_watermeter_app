import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class DailyRecordPage extends StatefulWidget {

  const DailyRecordPage({
    super.key,
  });


  @override
  State<DailyRecordPage> createState() => _DailyRecordPageState();
}

class _DailyRecordPageState extends State<DailyRecordPage> {

  //var showerTime = 0;
  //var dishingTime = 0;
  var showerWater = 0;
  var dishingWater = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dates = [];
    dates = prefs.getStringList('date') ?? [];

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm a');
    String formattedDate = formatter.format(now);
    //var result = json.decode(await widget.image!.openRead().transform(utf8.decoder).join());
    //final bytes = widget.image.readAsBytesSync();
    //String img64 = base64Encode(bytes);
    dates.add(formattedDate);
    prefs.setStringList('date', dates);
    prefs.setString('${formattedDate}_waterDaily', (dishingWater + showerWater).toString());
    //prefs.setString('${formattedDate}_image', img64);
    //prefs.setString('${formattedDate}_waterMeter', widget.waterMeter!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estimate Your Daily Water Input"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Check your water number"),
          TextFormField(
            decoration: const InputDecoration(
              helperText: "Enter How Many Minutes You took shower for Today",
              //labelText: widget.waterMeter,
              hintText: "Your Estimated Shower time (In Minutes)",
            ),
            onChanged: (value) {
              setState(() {
                showerWater = (int.parse(value)%60)*7 ;
              });
            },
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              helperText: "Enter How Many Minutes You took to wash dishes for Today",
              //labelText: widget.waterMeter,
              hintText: "Your Estimated Dishes time",
            ),
            onChanged: (value) {
              setState(() {
                dishingWater = (int.parse(value)%60)*3;
              });
            },
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () async {
                await _saveData();
                if(mounted) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              },
              child: const Text("Save Water number"))
        ],
      ),
    );
  }
}