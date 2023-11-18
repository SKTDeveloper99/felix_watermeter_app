import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  ResultPage({
    super.key,
    required this.listRecognized,
  });

  List<String> listRecognized;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://th-thumbnailer.cdn-si-edu.com/ii_ZQzqzZgBKT6z9DVNhfPhZe5g=/fit-in/1600x0/filters:focal(1061x707:1062x708)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer_public/55/95/55958815-3a8a-4032-ac7a-ff8c8ec8898a/gettyimages-1067956982.jpg"),
          if (widget.listRecognized != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Please Select the number of Your Water Meter"),
                DropdownMenu<String>(
                  initialSelection:  (widget.listRecognized!.isNotEmpty) ? widget.listRecognized?.first : "Nothing",
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      widget.listRecognized?.first = value!;
                      title = value!;
                    });
                  },
                  dropdownMenuEntries: widget.listRecognized!.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value,
                        label: value

                    );
                  }).toList(),
                ),
              ],
            )
        ],
      ),
    );
  }
}