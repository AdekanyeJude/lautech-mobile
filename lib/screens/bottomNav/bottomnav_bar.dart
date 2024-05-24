import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/main.dart';
import 'package:lautech_mobile/screens/home/dashboard/dashboard.dart';

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
                  'assets/imgs/icon/home (2).png',
                ),
                btmNavImg(
                  DashBoard(),
                  2,
                  'assets/imgs/icon/diamond.png',
                ),
                btmNavImg(
                  DashBoard(),
                  3,
                  'assets/imgs/icon/tag.png',
                ),
                btmNavImg(
                  DashBoard(),
                  4,
                  'assets/imgs/icon/profile.png',
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
                ? HexColor("#EE0A0A")
                : HexColor("#1A284B"),
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
