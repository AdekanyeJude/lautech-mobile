import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/dashboard/searchtextfield_row.dart';
import 'package:lautech_mobile/screens/home/manuals/view_manual_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class LevelManualScreen extends StatefulWidget {
  const LevelManualScreen({
    super.key,
    required this.level,
  });
  final level;

  @override
  State<LevelManualScreen> createState() => _LevelManualScreenState();
}

class _LevelManualScreenState extends State<LevelManualScreen> {
  TextEditingController searchcontroller = TextEditingController();
  get future => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorCodes.white,
        appBar: centerAlignedAppBar(context, '100 Level Manuals'),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Column(
              children: [
                searchtetField(
                  'Filter Manual',
                  searchcontroller,
                  () {},
                  width: 357.0,
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: HexColor("#905F32")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 205,
                        child: sourceSansText(
                          'Manual',
                          16.0,
                          colorCodes.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: sourceSansText(
                          'Size',
                          16.0,
                          colorCodes.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 78,
                        child: sourceSansText(
                          'Status',
                          16.0,
                          colorCodes.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: future,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          courseNameRow(
                              context,
                              'Fundamental of  Organic CSC202',
                              '3mb',
                              'Get Manual',
                              () {}),
                        ],
                      );
                    })
              ],
            ),
          ],
        ));
  }

  Widget courseNameRow(
      context, coursetitle, dataSize, manualStatus, geManualFunc) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 205,
                child: opensansText(coursetitle, 12.0, HexColor("#091031"),
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 30,
                child: opensansText(dataSize, 12.0, HexColor("#091031"),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 78,
                child: InkWell(
                  onTap: () {
                    if (manualStatus == 'Get Manual') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewManualScreen(
                                    level: widget.level,
                                    courseTitle: 'Fundamental of  Organic',
                                    courseCode: 'CSC102',
                                    dataSize: '3 MB',
                                    manualStatus: 'Get Manual',
                                    prieviousScreen: 'LevelManualScreen',
                                  )));
                    } else {}
                  },
                  child: opensansText(
                      manualStatus,
                      12.0,
                      manualStatus == 'Get Manual'
                          ? HexColor("#905F32")
                          : HexColor("#091031"),
                      align: TextAlign.end,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        opensansText(
            '.....................................................................',
            18.0,
            HexColor("#B39981").withOpacity(0.7)),
      ],
    );
  }
}
