import 'dart:convert';
import 'package:felix_watermeter_app/shared_prefs/specific_past_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);



  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Map _image = {};
  Map _waterMeter = {};

  void initState() {
    _loadHistory();
  }

  _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List dates = [];
    print(prefs.containsKey('date'));
    if (prefs.containsKey('date')) {
      dates = prefs.getStringList('date')!;
      for (var date in dates) {
        _image[date] = prefs.getString(date + '_image');
        _waterMeter[date] = prefs.getString(date + '_waterMeter');
      }
      print(_image.keys);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(213,212,249, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        toolbarHeight: 100,
        // flexibleSpace: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //       child: Container(
        //         height: 85,
        //         width: 100,
        //         decoration: const BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage("assets/file-history.png"),
        //             fit: BoxFit.fitHeight,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
      body: _image.isNotEmpty
          ? ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _image.length,
          itemBuilder: (BuildContext context, int index) {
            String date = _image.keys.elementAt(index);

            return Card(
                color: const Color.fromRGBO(215,236,209,1),
                child: ListTile(
                  title: Text(
                    date,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_circle_fill_outlined,
                        color: Color.fromRGBO(62, 0, 31, 1)),
                    tooltip: 'Show Images',
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ImagePage(
                                imageTaken: _image[date],
                                waterMeter: _waterMeter[date], title: date,
                              )));
                    },
                  ),
                ));
          })
          : const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No historical water meter are available',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
