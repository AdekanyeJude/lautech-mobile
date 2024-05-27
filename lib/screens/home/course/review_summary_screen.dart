import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/course_overview_screen.dart';
import 'package:lautech_mobile/screens/home/course/purchase_successful_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/normal_listtile.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class ReviewSummaryScreen extends StatefulWidget {
  const ReviewSummaryScreen(
      {super.key,
      required this.courseTitle,
      required this.courseCode,
      required this.courseUnit});
  final courseTitle, courseCode, courseUnit;

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorCodes.white,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/imgs/background-image.png'),
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              children: [
                Column(
                  children: [
                    backNavRow(
                      context,
                      'Review Summary',
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 148,
                          width: 126,
                          decoration: BoxDecoration(
                              color: colorCodes.white,
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/imgs/courseImg.png"))),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 168,
                              child: opensansText(
                                widget.courseTitle,
                                22.0,
                                HexColor("#091031"),
                                align: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            opensansText(
                              'Prof. Wale Oke',
                              16.0,
                              HexColor("#091031"),
                              align: TextAlign.start,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                courseCodeContainer(widget.courseCode),
                                SizedBox(width: 25),
                                courseCodeContainer(
                                    'Unit: ${widget.courseUnit}')
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                courseCodeContainer('80 PGs'),
                                SizedBox(width: 25),
                                courseCodeContainer('10 MB')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    priceChargesContainer(
                      '#2500.00',
                      '#100.00',
                      '#2600.00',
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: opensansText(
                          'Selected Payment Method', 22.0, HexColor("#091031"),
                          fontWeight: FontWeight.w600),
                    ),
                    imagelistTile('assets/imgs/mastercard 1.png',
                        'assets/imgs/mastercard-number.png', () {},
                        trailingWidget: SizedBox(
                          width: 2,
                        ),
                        tirdWidget: Row(
                          children: [
                            SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {},
                              child: opensansText(
                                  'Change', 20.0, HexColor("#EE0A0A"),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 70,
                    ),
                    authButton('Confirm Payment', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PurchaseSuccessfulScreen()));
                    })
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget priceChargesContainer(price, tax, total) {
    return Container(
      height: 191,
      width: 351,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: HexColor("#B39981"), borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              opensansText('Price', 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600),
              opensansText(price, 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600)
            ],
          ),
          opensansText(
            '.................................................',
            20.0,
            HexColor("#905F32"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              opensansText('Tax/Charges', 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600),
              opensansText(tax, 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600)
            ],
          ),
          opensansText(
            '.................................................',
            20.0,
            HexColor("#905F32"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              opensansText('Total (Naira)', 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600),
              opensansText(total, 22.0, HexColor("#FFFFFF"),
                  fontWeight: FontWeight.w600)
            ],
          ),
        ],
      ),
    );
  }
}
