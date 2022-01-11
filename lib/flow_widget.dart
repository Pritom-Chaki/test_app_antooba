import 'package:flutter/material.dart';
  const double btnSize = 80.0;
class FlowWidgetTest extends StatefulWidget {
  const FlowWidgetTest({Key? key}) : super(key: key);

  @override
  _FlowWidgetTestState createState() => _FlowWidgetTestState();
}

class _FlowWidgetTestState extends State<FlowWidgetTest>
    with SingleTickerProviderStateMixin {


  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
        delegate: FlowMenuDelegate(controller: controller),
        children: <IconData>[
          Icons.menu,
          Icons.mail,
          Icons.call,
          Icons.notifications
        ].map<Widget>(buildItem).toList());
  }

  Widget buildItem(IconData icon) => SizedBox(
        width: btnSize,
        height: btnSize,
        child: FloatingActionButton(
          elevation: 0,
          splashColor: Colors.black,
          child: Icon(
            icon,
            color: Colors.white,
            size: 45,
          ),
          onPressed: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;
  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    final xStart = size.width - btnSize;
    final yStart = size.height - btnSize;
    for (int i = context.childCount -1 ; i >=0 ; i--) {
      final childSize = context.getChildSize(i)!.width;
      const margin = 8.0;
      final dx = (childSize + margin) * i;
      final x = xStart;
      final y = yStart - dx * controller.value;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
