import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/dashboard/searchtextfield_row.dart';
import 'package:lautech_mobile/screens/home/manuals/view_manual_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class DownloadedManualScreen extends StatefulWidget {
  const DownloadedManualScreen({super.key});

  @override
  State<DownloadedManualScreen> createState() => _DownloadedManualScreenState();
}

class _DownloadedManualScreenState extends State<DownloadedManualScreen> {
  TextEditingController searchcontroller = TextEditingController();

  get future => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Downloaded Manuals'),
      backgroundColor: colorCodes.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          Column(
            children: [
              opensansText('Purchased Manuals', 14.0,
                  HexColor("#091031").withOpacity(0.5)),
              SizedBox(
                height: 11,
              ),
              searchtetField(
                'Filter Manual',
                searchcontroller,
                () {},
                width: 357.0,
              ),
              SizedBox(
                height: 34,
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
                        'Function',
                        16.0,
                        colorCodes.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        courseNameRow(context, 'Fundamental of  Organic CSC202',
                            '3mb', 'Downloaded', () {}),
                      ],
                    );
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget courseNameRow(
      context, coursetitle, dataSize, manualStatus, geManualFunc) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewManualScreen(
                                  level: '100',
                                  courseTitle: coursetitle,
                                  courseCode: 'CSC',
                                  dataSize: dataSize,
                                  manualStatus: manualStatus,
                                  prieviousScreen: 'DownloadedManualScreen',
                                )));
                  },
                  child: DottedBorder(
                    radius: Radius.circular(5),
                    child: Container(
                      alignment: Alignment.center,
                      child: opensansText('Open', 12.0, HexColor("#091031"),
                          align: TextAlign.end, fontWeight: FontWeight.w600),
                    ),
                  ),
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
