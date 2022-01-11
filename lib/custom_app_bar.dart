import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF1C2B4A),
      elevation: 0.0,
      title: Center(
        child: Container(
          alignment: Alignment.center,
          
          height:70 ,
          width: 137,
          child: SvgPicture.asset(
            "assets/images/title_logo.svg",
          ),
        ),
      ),
    );
  }
}
