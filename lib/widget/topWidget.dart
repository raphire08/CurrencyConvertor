import 'package:flutter/material.dart';
import 'package:sivisoft/common.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'SIVISOFT',
        style: bigWhite,
      ),
      SizedBox(height: 25.0),
      Text(
        'CURRENCY CONVERTOR',
        style: mediumWhite,
      ),
    ]);
  }
}
