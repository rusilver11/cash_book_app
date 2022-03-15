import 'package:cash_book/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderHome()
        ],
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      //it will cover 20% of our total height
      height: SizeConfig.screenHeight * 02,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding
              ),
            height: SizeConfig.screenHeight * 0.2 - 41,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
            ),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Total Saldo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kTextIIColor
                      ),
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
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
