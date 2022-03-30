import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/app_item.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_helper.dart';

class AppSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  CarouselController carouselController = CarouselController();
  Widget _buildUi(double width, BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 30),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enableInfiniteScroll: true,
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
        height: carouselContainerHeight,
      ),
      items: [
        //1 News app
        appitem(
          width: width,
          titleNum: "FLUTTER APP 1",
          title: "News APP",
          text:
              " local news app for current events, free live news, business news, and more.",
          image: "assets/11.png",
          gUrl: 'https://github.com/Omarmoaz10/news_app',
        ),
        appitem(
          width: width,
          titleNum: "FLUTTER APP 2",
          title: "DUMMY Shop",
          text:
              " local news app for current events, free live news, business news, and more.",
          image: "assets/11.png",
          gUrl: 'https://github.com/Omarmoaz10/news_app',
        ),
        appitem(
          width: width,
          titleNum: "FLUTTER APP 3",
          title: "Clinic Management",
          text:
              " local news app for current events, free live news, business news, and more.",
          image: "assets/11.png",
          gUrl: 'https://github.com/Omarmoaz10/news_app',
        ),
      ],
    );
  }
}
