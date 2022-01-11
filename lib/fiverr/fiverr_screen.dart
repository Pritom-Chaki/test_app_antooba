import 'package:flutter/material.dart';
import 'package:test_app/fiverr/fiverr_screen2.dart';

class FiverrScreen extends StatefulWidget {
  const FiverrScreen({Key? key}) : super(key: key);

  @override
  _FiverrScreenState createState() => _FiverrScreenState();
}

class _FiverrScreenState extends State<FiverrScreen> {
  int grpValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF881284),
      appBar: AppBar(
        backgroundColor: const Color(0xFF640D64),
        title: const Text("Country Selection"),
        centerTitle: false,
      ),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Please Select Your Locations",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            _selectOption(),
            Spacer(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _selectOption() {
    return Theme(
      data: ThemeData(
        //here change to your color
        unselectedWidgetColor: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Radio(
                value: 0,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "Ghana",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 1,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "Nigeria",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "Zambia",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "Europe",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 4,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "USA",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                value: 5,
                activeColor: Colors.white,
                groupValue: grpValue,
                onChanged: (int? value) {
                  setState(() {
                    grpValue = value!;
                  });
                },
              ),
              const Text(
                "Asia",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            child: const Text(
              "Cancel",
              style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700)
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>( const Color(0xFFC130A7)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color:  Color(0xFFB758B4), width: 2.0)
                )
              )
            ),
            onPressed: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FiverrScreen2()));

            }
          ),
        ),
              const SizedBox(width: 15.0,),
                Expanded(
                  child: ElevatedButton(
                          child: const Text(
                            "  Next  ",
                            style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w700)
                          ),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>( const Color(0xFFC130A7)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color:  Color(0xFFB758B4), width: 2.0)
                              )
                            )
                          ),
                          onPressed: () {
                               Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FiverrScreen2()));
                          }
                        ),
                ),
      ],
    );
    
    
    // MaterialButton(
    //   color: const Color(0xFFC130A7),
    //   onPressed: () {},
    //   child: const Text(
    //     "Cancel",
    //     style: TextStyle(color: Colors.white, fontSize: 16),
    //   ),
    // );
  }
}
