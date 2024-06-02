import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/main.dart';
import 'package:lautech_mobile/screens/home/assignment/assignment_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';
import 'package:lautech_mobile/screens/home/manuals/my_manual_screen.dart';
import 'package:lautech_mobile/screens/home/profile/myprofile_screen.dart';
import 'package:lautech_mobile/screens/home/quiz/quizzes_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 62,
          padding: EdgeInsets.only(top: 7, bottom: 10),
          decoration: BoxDecoration(color: colorCodes.white, boxShadow: [
            BoxShadow(
                color: colorCodes.black.withOpacity(0.2),
                spreadRadius: 5.0,
                blurRadius: 8.0)
          ]),
          alignment: Alignment.center,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                btmNavImg(
                  DashBoard(),
                  1,
                  'assets/imgs/icon/home.png',
                ),
                btmNavImg(
                  MyManualsScreen(),
                  2,
                  'assets/imgs/icon/manuals.png',
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: HexColor("#905F32")),
                      child: Image.asset(
                        'assets/imgs/icon/assignment-icn.png',
                        height: 3,
                        width: 30,
                        scale: 4,
                        // color:  HexColor("#060505"),
                      )),
                ),
                btmNavImg(
                  AssignmentsScreen(),
                  4,
                  'assets/imgs/icon/assignments.png',
                ),
                btmNavImg(
                  MyProfileScreen(),
                  5,
                  'assets/imgs/profile.png',
                ),
              ]),
        ),
      ),
    );
  }

  Widget btmNavImg(location, indexId, img, {height, width}) {
    return Expanded(
      child: InkWell(
          onTap: () {
            setState(() {
              currentIndex = indexId;
            });
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => location));
          },
          child: Image.asset(
            img,
            height: height ?? 24,
            width: width ?? 24,
            color: currentIndex == indexId
                ? HexColor("#905F32")
                : HexColor("#060505"),
          )
          //  Image.asset(
          //   "]",
          //   height: 24,
          //   width: 24,
          // ),
          ),
    );
  }
}
