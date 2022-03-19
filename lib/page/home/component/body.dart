import 'dart:ui';

import 'package:cash_book/constants.dart';
import 'package:cash_book/page/home/component/home_card.dart';
import 'package:cash_book/page/home/component/home_header.dart';
import 'package:cash_book/page/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/date_range.dart';
import '../../../size_config.dart';
import 'date_listview_button.dart';
import 'home_card.dart';

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
            HomeCard(
              //transaction
              headerTitle: 'Transaksi',
              bodyTitleLeft: 'Pemasukan',
              bodyTitleRight: 'Pengeluaran',
              showSummary: true,
              textAmountLeft: 630000,
              textAmountRight: 1000000,
              press: () {
                Navigator.pushNamed(context, TransactionScreen.routeName);
              },
            ),
            HomeCard(
              //AP and AR
              headerTitle: 'Utang Piutang',
              bodyTitleLeft: 'Utang Saya',
              bodyTitleRight: 'Utang Pelanggan',
              showSummary: false,
              textAmountLeft: 60000,
              textAmountRight: 20000,
              press: () {
                Navigator.pushNamed(context, TransactionScreen.routeName);
              },
            ),
            Container(
             padding: EdgeInsets.symmetric(
              horizontal:getProportionateScreenWidth(18),
              vertical:getProportionateScreenHeight(10) ),
              child: Align(
                alignment: Alignment.topCenter,
                child: DataTable(
                  columnSpacing: SizeConfig.screenWidth*0.2+18,
                  horizontalMargin: kDefaultPadding,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Transaksi baru',
                        style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Lihat semua',
                        style: TextStyle(fontStyle: FontStyle.normal),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    5, 
                    (index) =>
                    DataRow(
                      cells: <DataCell>[
                        DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.2),
                          child:Text('Kecantikan/perawatan tubuh')
                            )
                          ),
                        DataCell(ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.2),
                          child:Text('6 Transaksi')
                          )
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
