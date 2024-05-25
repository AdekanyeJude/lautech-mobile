import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/screens/home/dashboard/course_container.dart';
import 'package:lautech_mobile/screens/home/dashboard/searchtextfield_row.dart';
import 'package:lautech_mobile/utils/texts/poppins_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/imgs/background-image.png'),
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        poppinsText(
                          'Hello, Tayo ',
                          16.0,
                          HexColor("#1A284B"),
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/imgs/icon/there's-notification.png",
                            width: 20,
                            height: 23,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    searchtextfieldRow(
                      searchcontroller,
                      () {},
                      () {},
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Container(
                      height: 123,
                      width: 331,
                      decoration: BoxDecoration(
                        color: HexColor("#905F32").withOpacity(0.8),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          sourceSansText(
                            'Have you read a book \ntoday?',
                            18.0,
                            HexColor("#FFFFFF"),
                            fontWeight: FontWeight.w600,
                            align: TextAlign.start,
                          ),
                          Image.asset(
                            'assets/imgs/Image.png',
                            height: 123,
                            width: 125,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 53,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        poppinsText(
                          'Latest books',
                          14.0,
                          HexColor("#1A284B"),
                          fontWeight: FontWeight.w500,
                        ),
                        InkWell(
                          child: poppinsText(
                            'See all',
                            14.0,
                            HexColor("#EB5757"),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        courseContainer(
                            'assets/imgs/course-image.png',
                            'assets/imgs/icon.png',
                            'Professor Bello',
                            'CHM 101: Introduction to Chemistry',context),
                        courseContainer(
                            'assets/imgs/course-image.png',
                            'assets/imgs/icon.png',
                            'Professor Bello',
                            'CHM 101: Introduction to Chemistry',context)
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
          bottomNavigationBar: BottomNavBar(),
    );
  }
}
