import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key, 
    required this.headerTitle, 
    required this.bodyTitleLeft, 
    required this.bodyTitleRight, 
    required this.textAmountLeft, 
    required this.textAmountRight, 
    required this.showSummary, 
    required this.press,
  }) : super(key: key);

  final String? headerTitle;
  final String? bodyTitleLeft, bodyTitleRight;
  final int? textAmountLeft, textAmountRight;
  final bool? showSummary;
  final Function? press;
  
  @override
  Widget build(BuildContext context) {

    var compareAmount = sumAmount(textAmountLeft!, textAmountRight!);
    
    return SizedBox(
      //Body
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:getProportionateScreenWidth(18),
          vertical:getProportionateScreenHeight(10) ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              //Header
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(headerTitle!,
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
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          //pemasukan n pengeluaran
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: getProportionateScreenHeight(8),
                              children: [
                                Text(
                                  bodyTitleLeft!,
                                  textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14))),
                                Text(
                                 textAmountLeft!.idrFormat(),
                                 textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: kIncomeColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.end,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              spacing: getProportionateScreenHeight(8),
                              children: [
                                Text(bodyTitleRight!,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14))),
                                Text(
                                  textAmountRight!.idrFormat(),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: kExpenseColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        showSummary == true? Container(
                          // hightlight
                          alignment: Alignment.centerLeft,
                          height: getProportionateScreenHeight(24),
                          width: double.infinity,
                          margin:
                              EdgeInsets.all(getProportionateScreenHeight(8)),
                          padding: EdgeInsets.only(left: 5.0),
                          decoration: BoxDecoration(
                            color: compareAmount >= 0 ? kIncomeLightColor:kExpenseLightColor, //color income plus
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            compareAmount >=0 ? 'Untung : ${compareAmount.idrFormat()}':'Rugi : ${compareAmount.idrFormat()}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: compareAmount >= 0 ? kIncomeColor : kExpenseColor//color income plus
                                ),
                          ),
                        )
                        : SizedBox(height: getProportionateScreenHeight(20))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: press as void Function(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                SvgPicture.asset('assets/icons/icon_file.svg'),
                                Text(
                                  'Lihat Laporan',
                                  style: TextStyle(color: kTextIIColor),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: kTextIIColor,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  int sumAmount(int income, int expense){
  var total = 0;
  total = income - expense;
  return total;
}

}
