import 'dart:convert';
import 'package:felix_watermeter_app/shared_prefs/specific_past_page.dart';
import 'package:felix_watermeter_app/shared_prefs/specific_water_daily_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryDailyWaterPage extends StatefulWidget {
  HistoryDailyWaterPage({Key? key}) : super(key: key);



  @override
  _HistoryDailyWaterPageState createState() => _HistoryDailyWaterPageState();
}

class _HistoryDailyWaterPageState extends State<HistoryDailyWaterPage> {
  Map _waterDaily = {};


  void initState() {
    _loadHistory();
  }

  _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List dates = [];
    //var formatter = DateFormat('yyyy-MM-dd hh:mm a');
    // print(prefs.containsKey('date'));
    if (prefs.containsKey('date')) {
      dates = prefs.getStringList('date')!;
      for (var date in dates) {
        if (prefs.getString(date + '_waterDaily') == null) {
          continue;
        }
        print(prefs.getString(date + '_waterDaily'));
        _waterDaily[date] = prefs.getString(date + '_waterDaily');
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromRGBO(213,212,249, 1),
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(30.0),
      //       bottomRight: Radius.circular(30.0),
      //     ),
      //   ),
      //   toolbarHeight: 100,
      // ),
      body: _waterDaily.isNotEmpty
          ? ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: _waterDaily.length,
          itemBuilder: (BuildContext context, int index) {
            String date = _waterDaily.keys.elementAt(index);
            return Card(
                color: const Color.fromRGBO(215,236,209,1),
                child: ListTile(
                  title: Text(
                    date,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_circle_fill_outlined,
                            color: Color.fromRGBO(62, 0, 31, 1)),
                        tooltip: 'Show Images',
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => WaterDailyPage(
                                    waterDaily: _waterDaily[date], title: date,
                                  )));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Color.fromRGBO(203, 52, 127, 1.0)),
                        tooltip: 'Delete ',
                        onPressed: () async {
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          await preferences.remove(_waterDaily[date]);
                        },
                      ),
                    ],
                  ),


                )
            );
          })
          : const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No historical water daily record are available',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
