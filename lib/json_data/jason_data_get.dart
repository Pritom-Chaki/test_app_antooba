import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class JsonDataGetClass extends StatefulWidget {
  const JsonDataGetClass({Key? key}) : super(key: key);

  @override
  _JsonDataGetClassState createState() => _JsonDataGetClassState();
}

class _JsonDataGetClassState extends State<JsonDataGetClass> {
  List _items = [];
  String? _selectPost = '';
  String? _selectDivision = '';
  String? _selectDistrict = '';
    String? _selectThana = '';
  String? _selectSuboffice = '';
  final TextEditingController _idController = TextEditingController();
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  void _setData(String getValue) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i]["en"]["postcode"] == getValue.trim().toLowerCase()) {
        setState(() {
          _selectPost = _items[i]["en"]["postcode"];
          _selectDivision = _items[i]["en"]["division"];
          _selectDistrict = _items[i]["en"]["district"];
                    _selectThana = _items[i]["en"]["thana"];
          _selectSuboffice = _items[i]["en"]["BangabhabanTSO"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kindacode.com',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),
            TextField(
              controller: _idController,
              onChanged: (value) {
                _setData(value);
              },
              decoration: const InputDecoration(hintText: "Input PostCode"),
            ),
            ElevatedButton(
              child: const Text('Select Data'),
              onPressed: () {
                _setData(_idController.text);
              },
            ),
            // Display the data loaded from sample.json

            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "Select Post: $_selectPost",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Select Div: $_selectDivision",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "Select Dis: $_selectDistrict",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                                    Text(
                    "Select Thana: $_selectThana",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                                    Text(
                    "Select Sub: $_selectSuboffice",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(5),
                          child: Text(_items[index]["en"]["postcode"]),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
