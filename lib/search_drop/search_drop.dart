import 'package:flutter/material.dart';

class SearchDrop extends StatefulWidget {
  const SearchDrop({Key? key}) : super(key: key);

  @override
  _SearchDropState createState() => _SearchDropState();
}

class _SearchDropState extends State<SearchDrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("search and dropdown"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width-20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFieldClass(),

            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldClass extends StatefulWidget {
  const TextFieldClass({Key? key}) : super(key: key);

  @override
  _TextFieldClassState createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  late TextEditingController controller;
  OverlayEntry? entry;

  @override
  void initState() {
    controller = TextEditingController();
   // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());
    focusNode.addListener((){
      if (focusNode.hasFocus){
        showOverlay(); 
      } else{
        hideOverlay(); 
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    //final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
      builder: (context) => Positioned(
        // left: offset.dx,
        // top: offset.dy +size.height+5,
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height+5),
          child: buildOverlay()),
      ),
    );
    overlay.insert(entry!);
  }

  void hideOverlay(){
    entry?.remove();
    entry = null; 
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          label: const Text("Hello"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return          ListTile(
                  leading: Image.network(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    fit: BoxFit.fill,
                  ),
                  title: const Text("Demo title"),
                  subtitle: const Text("Demo subtitle"),
                  onTap: () {
                    controller.text = "Demo title";
                    hideOverlay();
                    focusNode.unfocus();
                  },
                );
          },
        ),
      );
}