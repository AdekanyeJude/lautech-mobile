import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/screens/home/course/level_container.dart';
import 'package:lautech_mobile/screens/home/manuals/downloaded_manual_screen.dart';
import 'package:lautech_mobile/screens/home/manuals/semester_screen.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class MyManualsScreen extends StatefulWidget {
  const MyManualsScreen({super.key});

  @override
  State<MyManualsScreen> createState() => _MyManualsScreenState();
}

class _MyManualsScreenState extends State<MyManualsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: true,
        title: opensansText('My Manuals', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DownloadedManualScreen()));
              },
              child: Image.asset(
                'assets/imgs/downloaded.png',
                height: 20,
                width: 20,
              ),
            ),
          )
        ],
      ),
      backgroundColor: colorCodes.white,
      extendBody: true,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Column(
              children: [
                levelContainer(
                  '100 Level Manuals',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LevelManualScreen(
                                level: '100',
                              )),
                    );
                  },
                ),
                levelContainer(
                  '200 Level Manuals',
                  () {},
                ),
                levelContainer(
                  '300 Level Manuals',
                  () {},
                ),
                levelContainer(
                  '400 Level Manuals',
                  () {},
                ),
              ],
            )
          ]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
