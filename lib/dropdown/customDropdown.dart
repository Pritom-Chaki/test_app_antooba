
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final _userEditTextController = TextEditingController(text: 'Mrs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(4),
            children: <Widget>[
              ///Menu Mode with no searchBox MultiSelection
              DropdownSearch<String>.multiSelection(
                key: _multiKey,
                   showSearchBox: true,
                validator: (List<String>? v) {
                  return v == null || v.isEmpty ? "required field" : null;
                },
                dropdownBuilder: (context, selectedItems) {
                  Widget item(String i) => Container(
                        padding: const EdgeInsets.only(
                            left: 6, bottom: 3, top: 3, right: 0),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColorLight),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              i,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            MaterialButton(
                              height: 10,
                              shape: const CircleBorder(),
                              focusColor: Colors.red[200],
                              hoverColor: Colors.red[200],
                              padding: const EdgeInsets.all(0),
                              minWidth: 25,
                              onPressed: () {
                                _multiKey.currentState?.removeItem(i);
                              },
                              child: const Icon(
                                Icons.close_outlined,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      );
                  return Wrap(
                    children: selectedItems.map((e) => item(e)).toList(),
                  );
                },
                popupCustomMultiSelectionWidget: (context, list) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I unselect all items in the list?
                            _multiKey.currentState?.closeDropDownSearch();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I select all items in the list?
                            _multiKey.currentState?.popupSelectAllItems();
                          },
                          child: const Text('All'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: OutlinedButton(
                          onPressed: () {
                            // How should I unselect all items in the list?
                            _multiKey.currentState?.popupDeselectAllItems();
                          },
                          child: const Text('None'),
                        ),
                      ),
                    ],
                  );
                },
                dropdownSearchDecoration: const InputDecoration(
                  hintText: "Select a country",
                  labelText: "Menu mode multiSelection*",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                mode: Mode.MENU,
                showSelectedItems: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                showClearButton: true,
                onChanged: print,
                popupSelectionWidget: (cnt, String item, bool isSelected) {
                  return isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green[500],
                        )
                      : Container();
                },
                popupItemDisabled: (String s) => s.startsWith('I'),
                clearButtonSplashRadius: 20,
                selectedItems: ["Tunisia"],
              ),
             const Divider(), 

              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                dropdownSearchDecoration: const InputDecoration(
                  hintText: "Select a country",
                  labelText: "Menu mode *",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                mode: Mode.MENU,
                showSelectedItems: true,
                items: const ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String? s) => s?.startsWith('I') ?? false,
                clearButtonSplashRadius: 20,
                selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
             const Divider(),

              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                showSearchBox: true,
                dropdownSearchDecoration: const InputDecoration(
                  hintText: "Select a country",
                  labelText: "Menu mode with helper *",
                  helperText: 'positionCallback example usage',
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                mode: Mode.MENU,
                showSelectedItems: true,
                items: const ["Brazil", "Italia", "Tunisia", 'Canada'],
                onChanged: print,
                selectedItem: "Tunisia",
                positionCallback: (popupButtonObject, overlay) {
                  final decorationBox = _findBorderBox(popupButtonObject);

                  double translateOffset = 0;
                  if (decorationBox != null) {
                    translateOffset = decorationBox.size.height -
                        popupButtonObject.size.height;
                  }

                  // Get the render object of the overlay used in `Navigator` / `MaterialApp`, i.e. screen size reference
                  final RenderBox overlay = Overlay.of(context)!
                      .context
                      .findRenderObject() as RenderBox;
                  // Calculate the show-up area for the dropdown using button's size & position based on the `overlay` used as the coordinate space.
                  return RelativeRect.fromSize(
                    Rect.fromPoints(
                      popupButtonObject
                          .localToGlobal(
                              popupButtonObject.size.bottomLeft(Offset.zero),
                              ancestor: overlay)
                          .translate(0, translateOffset),
                      popupButtonObject.localToGlobal(
                          popupButtonObject.size.bottomRight(Offset.zero),
                          ancestor: overlay),
                    ),
                    Size(overlay.size.width, overlay.size.height),
                  );
                },
              ),
              
              Divider(),

              ///Menu Mode with overriden icon and dropdown buttons
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownSearch<String>(
                      validator: (v) => v == null ? "required field" : null,
                      mode: Mode.MENU,
                      dropdownSearchDecoration:const InputDecoration(
                        hintText: "Select a country",
                        labelText: "Menu mode *",
                        filled: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF01689A)),
                        ),
                      ),
                      showAsSuffixIcons: true,
                      clearButtonBuilder: (_) => const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  Icon(
                          Icons.clear,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      dropdownButtonBuilder: (_) => const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      showSelectedItems: true,
                      items: const [
                        "Brazil",
                        "Italia (Disabled)",
                        "Tunisia",
                        'Canada'
                      ],
                      showClearButton: true,
                      onChanged: print,
                      popupItemDisabled: (String? s) =>
                          s?.startsWith('I') ?? true,
                      selectedItem: "Tunisia",
                    ),
                  ),
                 const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Menu mode *",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF01689A)),
                      ),
                    ),
                  ))
                ],
              ),
            const  Divider(),
              DropdownSearch<UserModel>.multiSelection(
                searchFieldProps: TextFieldProps(
                  controller: _userEditTextController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _userEditTextController.clear();
                      },
                    ),
                  ),
                ),
                mode: Mode.BOTTOM_SHEET,
                maxHeight: 700,
                isFilteredOnline: true,
                showClearButton: true,
                showSelectedItems: true,
                compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
                showSearchBox: true,
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'User *',
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (u) =>
                    u == null || u.isEmpty ? "user field is required " : null,
                onFind: (String? filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExampleMultiSelection,
                popupItemBuilder: _customPopupItemBuilderExample,
                popupSafeArea:const PopupSafeAreaProps(top: true, bottom: true),
                scrollbarProps: ScrollbarProps(
                  isAlwaysShown: true,
                  thickness: 7,
                ),
              ),
              Divider(),

              ///custom itemBuilder and dropDownBuilder
              DropdownSearch<UserModel>(
                showSelectedItems: true,
                compareFn: (i, s) => i?.isEqual(s) ?? false,
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "Person",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onFind: (String? filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExample,
                popupItemBuilder: _customPopupItemBuilderExample2,
              ),
              Divider(),

              ///BottomSheet Mode with no searchBox
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: const [
                  "Brazil",
                  "Italia",
                  "Tunisia",
                  'Canada',
                  'Zraoua',
                  'France',
                  'Belgique'
                ],
                dropdownSearchDecoration:const InputDecoration(
                  labelText: "Custom BottomShet mode",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onChanged: print,
                selectedItem: "Brazil",
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search a country1",
                  ),
                ),
                popupTitle: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child:const Center(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
            const  Divider(),

              ///show favorites on top list
              DropdownSearch<UserModel>.multiSelection(
                showSelectedItems: true,
                showSearchBox: true,
                compareFn: (i, s) => i?.isEqual(s) ?? false,
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "Person with favorite option",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onFind: (filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
              //   dropdownBuilder: _customDropDownExample(),
                popupItemBuilder: _customPopupItemBuilderExample2,
                showFavoriteItems: true,
                favoriteItemsAlignment: MainAxisAlignment.start,
                favoriteItems: (items) {
                  return items.where((e) => e.name.contains("Mrs")).toList();
                },
                favoriteItemBuilder: (context, item, isSelected) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    child: Row(
                      children: [
                        Text(
                          "${item.name}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.indigo),
                        ),
                    const    Padding(padding: EdgeInsets.only(left: 8)),
                        isSelected
                            ? const Icon(Icons.check_box_outlined)
                            : Container(),
                      ],
                    ),
                  );
                },
              ),
           const   Divider(),

              ///merge online and offline data in the same list and set custom max Height
              DropdownSearch<UserModel>(
                items: [
                  UserModel(name: "Offline name1", id: "999"),
                  UserModel(name: "Offline name2", id: "0101")
                ],
                maxHeight: 300,
                onFind: (String? filter) => getData(filter),
                dropdownSearchDecoration:const InputDecoration(
                  labelText: "choose a user",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onChanged: print,
                showSearchBox: true,
              ),
         const     Divider(),

              ///open dropdown programmatically
              DropdownSearch<String>(
                items: const ["no action", "confirm in the next dropdown"],
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "open another dropdown programmatically",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) {
                  if (v == "confirm in the next dropdown") {
                    _openDropDownProgKey.currentState?.openDropDownSearch();
                  }
                },
              ),
             const Padding(padding: EdgeInsets.all(4)),
              DropdownSearch<String>(
                validator: (value) => value == null ? "empty" : null,
                key: _openDropDownProgKey,
                items: const ["Yes", "No"],
                dropdownSearchDecoration: const InputDecoration(
                  labelText: "confirm",
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border:  OutlineInputBorder(),
                ),
                showSelectedItems: true,
                dropdownButtonSplashRadius: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState?.openDropDownSearch();
                      },
                      child: const Text("Open dropdownSearch")),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem("No");
                      },
                      child: const Text("set to 'NO'")),
                  Material(
                    child: ElevatedButton(
                        onPressed: () {
                          _openDropDownProgKey.currentState
                              ?.changeSelectedItem("Yes");
                        },
                        child: const Text("set to 'YES'")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem('Blabla');
                      },
                      child: Text("set to 'Blabla'")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<UserModel?> selectedItems) {
    if (selectedItems.isEmpty) {
      return const  ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(),
        title: Text("No item selected"),
      );
    }

    return Wrap(
      children: selectedItems.map((e) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child:  Container(
            child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading:const CircleAvatar(
                  // this does not work - throws 404 error
                  // backgroundImage: NetworkImage(item.avatar ?? ''),
                  ),
              title: Text(e?.name ?? ''),
              subtitle: Text(
                e?.createdAt.toString() ?? '',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  RenderBox? _findBorderBox(RenderBox box) {
    RenderBox? borderBox;

    box.visitChildren((child) {
      if (child is RenderCustomPaint) {
        borderBox = child;
      }

      final box = _findBorderBox(child as RenderBox);
      if (box != null) {
        borderBox = box;
      }
    });

    return borderBox;
  }

  Widget _customDropDownExample(BuildContext context, UserModel? item) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.avatar == null)
          ?const ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(),
              title: Text("No item selected"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: const CircleAvatar(
                  // this does not work - throws 404 error
                  // backgroundImage: NetworkImage(item.avatar ?? ''),
                  ),
              title: Text(item.name),
              subtitle: Text(
                item.createdAt.toString(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, UserModel? item, bool isSelected) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading:const CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel? item, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item?.name ?? ''),
        subtitle: Text(item?.createdAt?.toString() ?? ''),
        leading:const CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => name;
}