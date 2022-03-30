import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/home/components/carousel.dart';
import 'package:portfolio_website/pages/home/components/cv_section.dart';
import 'package:portfolio_website/pages/home/components/education_section.dart';
import 'package:portfolio_website/pages/home/components/footer.dart';
import 'package:portfolio_website/pages/home/components/header.dart';
import 'package:portfolio_website/pages/home/components/skill_section.dart';
import 'package:portfolio_website/pages/home/components/apps_slider.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/globals.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  bool showBtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top button will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showBtn = true;
        setState(() {}); //update state
      } else {
        showBtn = false;
        setState(() {}); //update state
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0);
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 1000), //show/hide animation
        opacity: showBtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
                //go to top of scroll
                0, //scroll offset to go
                duration:
                    const Duration(milliseconds: 500), //duration of scroll
                curve: Curves.fastOutSlowIn //scroll type
                );
          },
          child: const Icon(Icons.arrow_upward),
          backgroundColor: kDangerColor,
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Header(),
            ),
            Carousel(),
            const SizedBox(height: 20.0),
            CvSection(),
            AppSlider(),
            const SizedBox(height: 70.0),
            // WebsiteAd(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 28.0),
            //   child: PortfolioStats(),
            // ),
            const SizedBox(height: 50.0),
            EducationSection(),
            const SizedBox(height: 50.0),
            SkillSection(),
            const SizedBox(height: 50.0),
            // Sponsors(),
            // const SizedBox(
            //   height: 50.0,
            // ),
            // TestimonialWidget(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
