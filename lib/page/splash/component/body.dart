import 'package:cash_book/constants.dart';
import 'package:cash_book/page/login/login_screen.dart';
import 'package:cash_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//best practice
import '../component/splash_content.dart';
import '../../../components/default_button.dart';

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
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
                          Navigator.pushNamed(context, LoginScreen.routeName);
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

