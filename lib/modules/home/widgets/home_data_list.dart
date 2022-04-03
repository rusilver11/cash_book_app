import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';

//   List<Map<String, String>> newTransaksi = [
//   {'Category': 'Makanan/Minuman', 'Total': '6 Transaksi'},
//   {'Category': 'Kosmetik/Alat Kecantikan', 'Total': '7 Transaksi'},
//   {'Category': 'Elektronik', 'Total': '2 Transaksi'}
// ];

class HomeDataList extends StatelessWidget {
  HomeDataList({ Key? key, this.dataCount, this.headerString, this.newTransaksi }) : super(key: key);

  final int? dataCount;
  List<Map<String, String>>? newTransaksi = [];
  final String? headerString;
  
  @override
  Widget build(BuildContext context) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(headerString!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16) 
                      )),
                      Text('Lihat semua',
                      style: TextStyle(
                        color: kPrimaryLightColor
                      ))
                    ],
                    ),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: getProportionateScreenHeight(10)),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10)),
                    separatorBuilder: (_, index) => SizedBox(width: 20),
                    itemCount: dataCount!,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: SizeConfig.screenWidth * 0.5),
                                child: Text(newTransaksi![index]['Category'].toString())
                                ),
                            ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: SizeConfig.screenWidth * 0.5),
                                child: Text(
                                    newTransaksi![index]['Total'].toString())
                                ),
                          ],
                        ),
                        Divider(thickness: 1.0),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}