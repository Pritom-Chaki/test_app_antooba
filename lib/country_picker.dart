import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';


class CountryPickerExample extends StatefulWidget {
  const CountryPickerExample({Key? key}) : super(key: key);

  @override
  _CountryPickerExampleState createState() =>  _CountryPickerExampleState();
}

class _CountryPickerExampleState extends State<CountryPickerExample> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    //   supportedLocales: const [
    //     Locale("af"),
    //     Locale("am"),
    //     Locale("ar"),
    //     Locale("az"),
    //     Locale("be"),
    //     Locale("bg"),
    //     Locale("bn"),
    //     Locale("bs"),
    //     Locale("ca"),
    //     Locale("cs"),
    //     Locale("da"),
    //     Locale("de"),
    //     Locale("el"),
    //     Locale("en"),
    //     Locale("es"),
    //     Locale("et"),
    //     Locale("fa"),
    //     Locale("fi"),
    //     Locale("fr"),
    //     Locale("gl"),
    //     Locale("ha"),
    //     Locale("he"),
    //     Locale("hi"),
    //     Locale("hr"),
    //     Locale("hu"),
    //     Locale("hy"),
    //     Locale("id"),
    //     Locale("is"),
    //     Locale("it"),
    //     Locale("ja"),
    //     Locale("ka"),
    //     Locale("kk"),
    //     Locale("km"),
    //     Locale("ko"),
    //     Locale("ku"),
    //     Locale("ky"),
    //     Locale("lt"),
    //     Locale("lv"),
    //     Locale("mk"),
    //     Locale("ml"),
    //     Locale("mn"),
    //     Locale("ms"),
    //     Locale("nb"),
    //     Locale("nl"),
    //     Locale("nn"),
    //     Locale("no"),
    //     Locale("pl"),
    //     Locale("ps"),
    //     Locale("pt"),
    //     Locale("ro"),
    //     Locale("ru"),
    //     Locale("sd"),
    //     Locale("sk"),
    //     Locale("sl"),
    //     Locale("so"),
    //     Locale("sq"),
    //     Locale("sr"),
    //     Locale("sv"),
    //     Locale("ta"),
    //     Locale("tg"),
    //     Locale("th"),
    //     Locale("tk"),
    //     Locale("tr"),
    //     Locale("tt"),
    //     Locale("uk"),
    //     Locale("ug"),
    //     Locale("ur"),
    //     Locale("uz"),
    //     Locale("vi"),
    //     Locale("zh")
    //    ],
    //   // ignore: prefer_const_literals_to_create_immutables
    //   localizationsDelegates: [
    //     CountryLocalizations.delegate,
    //  //   GlobalMaterialLocalizations.delegate,
    //    // GlobalWidgetsLocalizations.delegate,
    //    ],
      home:  Scaffold(
        appBar:  AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: const ['+39', 'FR'],
                countryFilter: const ['IT', 'FR'],
                showFlagDialog: false,
                // comparator: (a, b) => b.name?.compareTo(a.name),
                //Get the country information relevant to the initial selection
                onInit: (code) =>
                    // ignore: avoid_print
                    print("on init ${code!.name} ${code.dialCode} ${code.name}"),
              ),
              CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: const ['+39', 'FR'],
                countryFilter: const ['IT', 'FR'],
                // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                flagDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
           
           //  country_code_picker: ^2.0.2
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (c){
                    print(c.dialCode);
                  },
                  hideMainText: true,
                  showFlagMain: true,
                  showFlag: true,
                  initialSelection: 'BD',
                  hideSearch: false,
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  alignLeft: false,
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (e) => print(e.toLongString()),
                  initialSelection: 'TF',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: const ['+39', 'FR'],
                ),
              ),
              SizedBox(
                width: 100,
                height: 60,
                child: CountryCodePicker(
                  enabled: false,
                  onChanged: (c) => c.name,
                  initialSelection: 'TF',
                  showCountryOnly: true,
                  showOnlyCountryWhenClosed: true,
                  favorite: const ['+39', 'FR'],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}