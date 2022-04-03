import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'widgets/body.dart' as homeBody;

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: mainAppBar(),
        body: homeBody.Body(),
        bottomNavigationBar: 
         BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: kInactiveColor,
                selectedIconTheme: IconThemeData(color: kPrimaryColor),
                unselectedIconTheme: IconThemeData(color: kInactiveColor),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/icon_Line_Home.svg'),
                    label: 'Home'
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/icon_Line_Transaction.svg'),
                    label: 'Transaksi'
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/icon_Line_Contact.svg'),
                    label: 'Inventory'
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/icon_Line_Inventory.svg'),
                    label: 'Hutang'
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/icon_Line_Category.svg'),
                    label: 'Lainnya'
                  ),
                ],
              ),
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