import 'dart:ui';

import 'package:cash_book/constants.dart';
import 'package:cash_book/page/home/component/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/date_range.dart';
import '../../../size_config.dart';
import 'date_listview_button.dart';
import 'transaction_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var defaultSelectedDate = 1;
  var selectedDateAction;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HomeHeader(),
            DateRangeButton(
              selected: defaultSelectedDate,
              callback: (int index, String function) {
                setState(() {
                  defaultSelectedDate = index;
                  selectedDateAction = function;
                });
              },
            ),
            CardTransaction()
          ],
        ),
      ),
    );
  }
}


