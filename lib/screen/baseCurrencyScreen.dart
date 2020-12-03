import 'package:flutter/material.dart';
import 'package:sivisoft/common.dart';
import 'package:sivisoft/model/currencyModel.dart';
import 'package:sivisoft/widget/topWidget.dart';

class BaseCurrencyScreen extends StatefulWidget {
  @override
  _BaseCurrencyScreenState createState() => _BaseCurrencyScreenState();
}

class _BaseCurrencyScreenState extends State<BaseCurrencyScreen> {
  String baseCurrency;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Stack(children: [
          Center(child: TopWidget()),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select your base',
                  style: smallWhite,
                ),
                SizedBox(height: 25.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: TextFormField(
                      cursorColor: backgroundColor,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (String value) {
                        baseCurrency = value;
                        print(baseCurrency);
                      }),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: InkWell(
                    onTap: () {
                      CurrencyModel currencyModel = CurrencyModel();
                      currencyModel.changeBaseCurrency(baseCurrency);
                      Navigator.pushNamed(context, 'compareCurrencyScreen',
                          arguments: currencyModel);
                    },
                    child: Text(
                      'NEXT',
                      style: smallWhite,
                    ),
                  ),
                )
              ]),
        ]),
      ),
    );
  }
}
