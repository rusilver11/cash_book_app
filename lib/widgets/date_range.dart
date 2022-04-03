import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';


class DateRangeButton extends StatelessWidget {
  DateRangeButton({
    Key? key,
    this.callback,
    this.selected,
  }) : super(key: key);

  final Function? callback;
  final int? selected;
  List<String> dateRange = [
    'DatePicker', //: 'Panggil DatePicker',
    'Semua', //: 'Panggill Semua',
    'Bulan ini', //: 'Panggil Bulan ini',
    'Bulan lalu', //: 'Panggill Bulan lalu',
    'Minggu ini', //: 'Panggil Minggu ini',
    'Hari ini' //: 'Panggill Hari ini'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        itemCount: dateRange.length,
        separatorBuilder: (_, index) => SizedBox(width: 20),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async {
            var getFnAction = await dateActionControll(index, context);
            callback!(index, getFnAction);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selected == index ? kPrimaryColor : kSecondaryColor),
            child: Wrap(
              children: [
                dateRange[index] != 'DatePicker'
                    ? Text(dateRange[index],
                        style: TextStyle(
                            color: selected == index
                                ? kTextIIColor
                                : kInactiveColor))
                    : Icon(Icons.calendar_month_sharp,
                        color:
                            selected == index ? kTextIIColor : kInactiveColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //datepicker
  Future<DateTime?> DatePickerControll(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  Future<String> dateActionControll(int dateIndex, BuildContext context) async {
    String? thisValue;

    switch (dateIndex) {
      case 0:
        await DatePickerControll(context)
            .then((value) => thisValue = value.toString());
        break;
      case 1:
        thisValue = 'Bulan ini';
        break;
      case 2:
        thisValue = 'Bulan lalu';
        break;
      case 3:
        thisValue = 'Minggu ini';
        break;
      case 4:
        thisValue = 'Hari ini';
        break;
    }
    return thisValue!;
  }
}
