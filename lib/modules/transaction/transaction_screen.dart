import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';

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