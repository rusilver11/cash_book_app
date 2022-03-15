import 'package:cash_book/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';
import 'component/body.dart' as homeBody;

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: mainAppBar(),
        body: homeBody.Body(),
    );
  }

  AppBar mainAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Hai Juragan',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kTextIIColor,
                fontSize: getProportionateScreenHeight(16)
              ),
              ),
            Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,)
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: SvgPicture.asset('assets/icons/icon_Notification.svg')
            )
        ],       
      );
  }
}