import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/links.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: camel_case_types, must_be_immutable
class appitem extends StatelessWidget {
  double? width;
  String? image;
  String? titleNum;
  String? title;
  String? text;
  String? gUrl;

  appitem({
    Key? key,
    this.width,
    this.text,
    this.gUrl,
    this.title,
    this.titleNum,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ResponsiveWrapper(
              maxWidth: width,
              minWidth: width!,
              defaultScale: false,
              child: Container(
                child: Flex(
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Image.asset(
                        image!,
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titleNum!,
                            style: GoogleFonts.lato(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            title!,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            text!,
                            style: const TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  height: 48.0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      gUrl;
                                      launchURL(gUrl!);
                                    },
                                    child: const Center(
                                      child: Text(
                                        "EXPLORE MORE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(width: 10.0),
                              // MouseRegion(
                              //   cursor: SystemMouseCursors.click,
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(8.0),
                              //       border: Border.all(
                              //         color: kPrimaryColor,
                              //       ),
                              //     ),
                              //     height: 48.0,
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 28.0),
                              //     child: TextButton(
                              //       onPressed: () {
                              //         carouselController.nextPage(
                              //             duration: const Duration(
                              //                 milliseconds: 300),
                              //             curve: Curves.linear);
                              //       },
                              //       child: const Center(
                              //         child: Text(
                              //           "NEXT APP",
                              //           style: TextStyle(
                              //             color: kPrimaryColor,
                              //             fontSize: 13.0,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
