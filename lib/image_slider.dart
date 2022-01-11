import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatefulWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomIndicatorState();
  }
}

class CustomIndicatorState extends State<CustomIndicator> {
  int currentPos = 0;
  List<String> listPaths = [
    "assets/images/home_banner1.png",
    "assets/images/home_banner2.png",
    "assets/images/home_banner1.png",
    "assets/images/home_banner2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CarouselSlider.builder(
        itemCount: listPaths.length,
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            // enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPos = index;
              });
            }),
        itemBuilder: (context, index, realIndex) {
          return _myImageView(listPaths[index]);
        },
      )),
    );
  }

  Widget _myImageView(String imgPath) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Image.asset(
          imgPath,
          fit: BoxFit.fill,
        ));
  }
}
