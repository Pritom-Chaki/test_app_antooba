import 'package:flutter/material.dart';

class KeyWordAdd extends StatefulWidget {
  const KeyWordAdd({Key? key}) : super(key: key);

  @override
  _KeyWordAddState createState() => _KeyWordAddState();
}

class _KeyWordAddState extends State<KeyWordAdd> {
  final TextEditingController _textController = TextEditingController();
  List<String> _keyWordList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KeyWord  Add Class"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              onChanged: (value) {
                _addKeyWordValue(value);
              },
              decoration: const InputDecoration(hintText: "Enter Keyword"),
            ),
            Container(
                height: 50,
                width: double.infinity,
                child: _keyWordList.length != 0
                    ? Wrap(
                        children: _keyWordList
                            .asMap()
                            .map((index, element) => MapEntry(
                                  index,
                                  Chip(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.black.withOpacity(0.1),
                                    shadowColor: Colors.black, //CircleAvatar
                                    label: Text(element),
                                    deleteIconColor: Colors.red,
                                    deleteIcon: const Icon(
                                      Icons.close_outlined,
                                      size: 14,
                                    ),
                                    onDeleted: () {
                                      _deleteChip(index);
                                    }, //Text
                                  ),
                                ))
                            .values
                            .toList(),
                      )
                    : const SizedBox(),

                ),
          ],
        ),
      ),
    );
  }

  void _addKeyWordValue(String value) {
//    value.endsWith(" ");
    if (value.endsWith(" ") && value.trim().isNotEmpty) {
      setState(() {
        _keyWordList.add(value.trim());
      });
      _textController.clear();
    }

    print("ADD : $_keyWordList");
  }

  void _deleteChip(int index) {
    setState(() {
      _keyWordList.removeAt(index);
    });
    print("Delete $_keyWordList");
  }
}
