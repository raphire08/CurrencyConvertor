import 'package:flutter/material.dart';
import 'package:sivisoft/api/rate.dart';
import 'package:sivisoft/common.dart';
import 'package:sivisoft/model/currencyModel.dart';
import 'package:sivisoft/widget/topWidget.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrencyModel currencyModel = ModalRoute.of(context).settings.arguments;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${currencyModel.baseCurrency} value: 1 ${currencyModel.baseCurrency}',
                    style: mediumWhite,
                  ),
                  Text(
                    'Edit Base Currency',
                    style: smallWhite,
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Divider(
                color: Colors.white,
                thickness: 1.0,
                indent: 0.0,
                endIndent: 0.0,
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today\'s Value',
                    style: mediumWhite,
                  ),
                  Text(
                    '+ Add more currency',
                    style: smallWhite,
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              FutureBuilder(
                  future: RateApi().getData(currencyModel.baseCurrency),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: currencyModel.compareCurrency
                            .map((e) => Text(
                                  '$e value: ${snapshot.data['rates'][e].toStringAsFixed(5)}',
                                  style: smallWhite,
                                ))
                            .toList(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text(
                        'Error in getting data',
                        style: smallWhite,
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  }),
            ],
          ),
        ]),
      ),
    );
  }
}
