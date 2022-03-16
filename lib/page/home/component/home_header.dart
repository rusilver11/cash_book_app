import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return  Container( //header
            padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding),
            //margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
            //it will cover 20% of our total height
            height: SizeConfig.screenHeight * 0.2 - 40,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Row(children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Total Saldo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kTextIIColor),
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.02),
                    Text(
                      'Rp 1.060.000',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        color: kTextIIColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }
}
