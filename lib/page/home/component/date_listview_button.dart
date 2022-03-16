import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class DateListViewButton extends StatefulWidget {
  const DateListViewButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DateListViewButton> createState() => _DateListViewButtonState();
}

class _DateListViewButtonState extends State<DateListViewButton> {

  bool _hasPressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                },
                child: _hasPressed? SvgPicture.asset('assets/icons/icon_Date(white).svg') : SvgPicture.asset('assets/icons/icon_Date(grey).svg'),
                style: ElevatedButton.styleFrom(
                  primary: _hasPressed ? kPrimaryColor:kSecondaryColor,
                  shape: const StadiumBorder(),
                ),
              ),
              SizedBox(width: SizeConfig.screenWidth * 0.02),
              DateRangeName(
                text: 'Semua',
                bgColor: _hasPressed ? kPrimaryColor:kSecondaryColor,
                press: (){
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                }),
              SizedBox(width: SizeConfig.screenWidth * 0.02),
              DateRangeName(
                text: 'Bulan ini',
                bgColor: _hasPressed ? kPrimaryColor:kSecondaryColor,
                press: (){
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                }),
              SizedBox(width: SizeConfig.screenWidth * 0.02),
              DateRangeName(
                text: 'Bulan lalu',
                bgColor: _hasPressed ? kPrimaryColor:kSecondaryColor,
                press: (){
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                }),
              SizedBox(width: SizeConfig.screenWidth * 0.02),
              DateRangeName(
                text: 'Minggu ini',
                bgColor: _hasPressed ? kPrimaryColor:kSecondaryColor,
                press: (){
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                }),
              SizedBox(width: SizeConfig.screenWidth * 0.02),
              DateRangeName(
                text: 'Hari ini',
                bgColor: _hasPressed ? kPrimaryColor:kSecondaryColor,
                press: (){
                  setState(() {
                    _hasPressed = !_hasPressed;
                  });
                }),
            ],
          ),
        ],
      ),
    );
  }
}

class DateRangeName extends StatelessWidget {
  const DateRangeName({
    Key? key, required this.text, required this.press,required this.bgColor
  }) : super(key: key);
final String? text;
final Function? press;
final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press as void Function(), //press,
      child: Text(
        text!,
        style: TextStyle(color: kTextColor),
      ),
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        shape: const StadiumBorder(),
      ),
    );
  }
}