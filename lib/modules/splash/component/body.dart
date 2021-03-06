import 'package:cash_book/core/config/constants.dart';
import 'package:cash_book/core/config/size_config.dart';
import 'package:cash_book/modules/login/login_screen.dart';
import 'package:cash_book/modules/splash/component/splash_content.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:cash_book/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'image': 'assets/images/new_welcoming(purple).svg',
      'text': 'Selamat datang, yuk atur keuangan mu!',
    },
    {
      'image': 'assets/images/new_news(purple).svg',
      'text':
          'Kami dapat memembantu mengatur, \nkeuangan pribadi mu maupun usaha mu',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]['image'],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(indexDot: index)),
                      ),
                      Spacer(flex: 3),
                      DefaultButton(
                        text: 'Lanjutkan',
                        press: (){
                          Get.offNamed(AppRoute.getLoginRoute());
                        },
                      ),
                        Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? indexDot}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == indexDot ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == indexDot ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

