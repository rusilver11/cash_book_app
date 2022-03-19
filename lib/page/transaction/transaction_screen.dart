import 'package:flutter/material.dart';

import '../../size_config.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({ Key? key }) : super(key: key);
  static String routeName = '/transaction';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('TransactionScreen'),
      ),
    );
  }
}