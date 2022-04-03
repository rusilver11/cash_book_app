import 'dart:ui';
import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/modules/home/widgets/home_data_list.dart';
import 'package:cash_book/modules/transaction/transaction_screen.dart';
import 'package:cash_book/widgets/date_range.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'date_listview_button.dart';
import 'home_card.dart';
import 'home_header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}
  List<Map<String, String>> newTransaksi = [
  {'Category': 'Makanan/Minuman', 'Total': '6 Transaksi'},
  {'Category': 'Kosmetik/Alat Kecantikan', 'Total': '7 Transaksi'},
  {'Category': 'Elektronik', 'Total': '2 Transaksi'}
];
  List<Map<String, String>> newAPAR = [
  {'Category': 'Akang', 'Total': 'Rp15.000'},
  {'Category': 'Bagas', 'Total': 'Rp100.000'},
  {'Category': 'Apis', 'Total': 'Rp21.000'}
];

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
            const Divider(
                color: kSecondaryColor,
                thickness: 5.0,
                endIndent: 22.0,
                indent: 22.0),
            HomeDataList(
              dataCount: newTransaksi.length,
              headerString: 'Transaksi anyar',
              newTransaksi: newTransaksi,
            ),
            const Divider(
                color: kSecondaryColor,
                thickness: 5.0,
                endIndent: 22.0,
                indent: 22.0),
            HomeDataList(
              dataCount: newTransaksi.length,
              headerString: 'Hutang Piutang',
              newTransaksi: newAPAR,
            ),
            const Divider(
                color: kSecondaryColor,
                thickness: 5.0,
                endIndent: 22.0,
                indent: 22.0),
          ],
        ),
      ),
    );
  }
}

// class dataTable extends StatelessWidget {
//   const dataTable({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: getProportionateScreenWidth(18),
//           vertical: getProportionateScreenHeight(10)),
//       width: double.infinity,
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: DataTable(
//           columnSpacing: SizeConfig.screenWidth * 0.3,
//           horizontalMargin: kDefaultPadding,
//           headingRowColor:
//               MaterialStateColor.resolveWith((states) => Colors.black12),
//           columns: const <DataColumn>[
//             DataColumn(
//               label: Text(
//                 'Transaksi baru',
//                 style: TextStyle(fontStyle: FontStyle.normal),
//               ),
//             ),
//             DataColumn(
//               label: Text(
//                 'Lihat semua',
//                 style: TextStyle(fontStyle: FontStyle.normal),
//               ),
//             ),
//           ],
//           rows: List<DataRow>.generate(
//             5,
//             (index) => DataRow(
//               cells: <DataCell>[
//                 DataCell(ConstrainedBox(
//                     constraints:
//                         BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.2),
//                     child: Text('Kecantikan/perawatan tubuh'))),
//                 DataCell(ConstrainedBox(
//                     constraints:
//                         BoxConstraints(maxWidth: SizeConfig.screenWidth * 0.2),
//                     child: Text('6 Transaksi'))),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
