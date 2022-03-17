import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //Body
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              //Header
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Transaksi',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16))),
              ],
            ),
            Card(
              shadowColor: Colors.black,
              elevation: 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //pemasukan n pengeluaran
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: getProportionateScreenHeight(8),
                        children: [
                          Text('Pemasukan',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14))),
                          Text(
                            'Rp 1.0000.000',
                            style: TextStyle(
                                color: kIncomeColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: getProportionateScreenHeight(8),
                        children: [
                          Text('Pengeluaran',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14))),
                          Text(
                            'Rp 6300.000',
                            style: TextStyle(
                                color: kExpenseColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    // hightlight
                    alignment: Alignment.centerLeft,
                    height: getProportionateScreenHeight(24),
                    width: double.infinity,
                    margin: EdgeInsets.all(getProportionateScreenHeight(8)),
                    padding: EdgeInsets.only(left: 5.0),
                    decoration: BoxDecoration(
                      color:
                          Color.fromRGBO(232, 249, 220, 1), //color income plus
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Text(
                      'Untung : Rp 680.000',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                          color: kIncomeColor //color income plus
                          ),
                    ),
                  ),
                  Card(
                    color: kPrimaryColor,
                    borderOnForeground: false,
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      SvgPicture.asset('assets/icons/icon_file.svg'),
                      Text(
                        'Lihat Laporan',
                        style: TextStyle(color: kTextIIColor),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: kTextIIColor,
                      )
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
