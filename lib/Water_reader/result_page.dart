import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class ResultPage extends StatefulWidget {

  ResultPage({
    super.key,
    required this.listRecognized,
    required this.waterMeter,
    required this.image,
  });

  List<String> listRecognized;
  String? waterMeter;
  File image;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List links = [];

  @override
  void initState() {
    super.initState();
    //uploadFileToServer();
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> dates = [];
    dates = prefs.getStringList('date') ?? [];

    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm a');
    String formattedDate = formatter.format(now);
    //var result = json.decode(await widget.image!.openRead().transform(utf8.decoder).join());
    final bytes = widget.image.readAsBytesSync();
    String img64 = base64Encode(bytes);
    dates.add(formattedDate);
    prefs.setStringList('date', dates);
    prefs.setString('${formattedDate}_image', img64);
    prefs.setString('${formattedDate}_waterMeter', widget.waterMeter!);
  }

  // void uploadFileToServer() async {
  //   // This url is for local server. Then this url'll change to the public url
  //   // var url = 'http://10.0.2.2:5000/'; // local host
  //   var url = 'http://3.16.55.7:5000'; // AWS/ec2 host
  //   print(url);
  //   Map<String, String> headers = {
  //     "Connection": "Keep-Alive",
  //     "Keep-Alive": "timeout=5, max=1000"
  //   };
  //
  //   http.MultipartRequest request = http.MultipartRequest(
  //       'POST', Uri.parse('$url/analyze')); //post request to URL/analize
  //   request.headers.addAll(headers);
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'video1',
  //       widget.video1File.path,
  //       contentType: MediaType('application', 'MP4'), //Media type
  //     ),
  //   );
  //
  //   request.files.add(
  //     await http.MultipartFile.fromPath(
  //       'video2',
  //       widget.video2File.path,
  //       contentType: MediaType('application', 'MP4'),
  //     ),
  //   );
  //
  //   request.send().then((r) async {
  //     print(r.statusCode);
  //
  //     if (r.statusCode == 200) {
  //       // print((json.decode(await r.stream.transform(utf8.decoder).join())).runtimeType);
  //       var result = json.decode(await r.stream.transform(utf8.decoder).join());
  //       print(result);
  //       setState(() {
  //         score = double.parse(result[0]).toStringAsFixed(2);
  //         links = result[1];
  //         _saveData();
  //       });
  //     } else {
  //       print('Error request');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(widget.image),
          const Text("Check your water number"),
          TextFormField(
            decoration: InputDecoration(
              helperText: "Enter Your water number if it is not correct",
              labelText: widget.waterMeter,
              hintText: widget.waterMeter,
            ),
            onChanged: (value) {
              setState(() {
                widget.waterMeter = value;
              });
            },
            validator: (String? value) {
              return (value != null && value.contains('@'))
                  ? 'Do not use the @ char.'
                  : null;
            },
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