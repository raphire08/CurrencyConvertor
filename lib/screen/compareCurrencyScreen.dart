import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sivisoft/common.dart';
import 'package:sivisoft/model/currencyModel.dart';
import 'package:sivisoft/widget/topWidget.dart';

class CompareCurrencyScreen extends StatefulWidget {
  @override
  _CompareCurrencyScreenState createState() => _CompareCurrencyScreenState();
}

class _CompareCurrencyScreenState extends State<CompareCurrencyScreen> {
  TextEditingController controller = TextEditingController();
  String holdingCurrency;
  @override
  Widget build(BuildContext context) {
    CurrencyModel currencyModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Stack(overflow: Overflow.clip, children: [
          Center(child: TopWidget()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Base Currency: ${currencyModel.baseCurrency}',
                style: mediumWhite,
              ),
              SizedBox(height: 30.0),
              Text('Currencies to compare', style: smallWhite),
              SizedBox(height: 30.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: TextFormField(
                        controller: controller,
                        cursorColor: backgroundColor,
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (String value) {
                          holdingCurrency = value;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          Icons.add,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            currencyModel.addCompareCurrency(holdingCurrency);
                            controller.clear();
                          });
                        }),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              currencyModel.compareCurrency != null
                  ? Wrap(
                      spacing: 10.0,
                      children: currencyModel.compareCurrency
                          .map((e) => Text(
                                e,
                                style: smallWhite,
                              ))
                          .toList())
                  : Container(),
              SizedBox(height: 50.0),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'resultScreen',
                        arguments: currencyModel);
                  },
                  child: Text(
                    'NEXT',
                    style: smallWhite,
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
