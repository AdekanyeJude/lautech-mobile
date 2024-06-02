// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:lautech_mobile/colors/colors.dart';
// import 'package:lautech_mobile/screens/home/course/add_card_screen.dart';
// import 'package:lautech_mobile/screens/home/course/course_overview_screen.dart';
// import 'package:lautech_mobile/utils/backnav_row.dart';
// import 'package:lautech_mobile/utils/normal_listtile.dart';
// import 'package:lautech_mobile/utils/texts/opensans_text.dart';

// class SelectPaymentMethodScreen extends StatefulWidget {
//   const SelectPaymentMethodScreen(
//       {super.key,
//       required this.courseTitle,
//       required this.courseCode,
//       required this.courseUnit});
//   final courseTitle, courseCode, courseUnit;

//   @override
//   State<SelectPaymentMethodScreen> createState() =>
//       _SelectPaymentMethodScreenState();
// }

// class _SelectPaymentMethodScreenState extends State<SelectPaymentMethodScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colorCodes.white,
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//           image: AssetImage('assets/imgs/background-image.png'),
//         )),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 30),
//           child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//               children: [
//                 Column(children: [
//                   backNavRow(
//                     context,
//                     'Select Payment Method',
//                   ),
//                   SizedBox(
//                     height: 29,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         height: 148,
//                         width: 126,
//                         decoration: BoxDecoration(
//                             color: colorCodes.white,
//                             borderRadius: BorderRadius.circular(25),
//                             image: DecorationImage(
//                                 image:
//                                     AssetImage("assets/imgs/courseImg.png"))),
//                       ),
//                       SizedBox(
//                         width: 11,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: 168,
//                             child: opensansText(
//                               widget.courseTitle,
//                               22.0,
//                               HexColor("#091031"),
//                               align: TextAlign.start,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           opensansText(
//                             'Prof. Wale Oke',
//                             16.0,
//                             HexColor("#091031"),
//                             align: TextAlign.start,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           SizedBox(
//                             height: 17,
//                           ),
//                           Row(
//                             children: [
//                               courseCodeContainer(widget.courseCode),
//                               SizedBox(width: 25),
//                               courseCodeContainer('Unit: ${widget.courseUnit}')
//                             ],
//                           ),
//                           SizedBox(
//                             height: 4,
//                           ),
//                           Row(
//                             children: [
//                               courseCodeContainer('80 PGs'),
//                               SizedBox(width: 25),
//                               courseCodeContainer('10 MB')
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 120,
//                   ),
//                   imagelistTile(
//                     'assets/imgs/visa.png',
//                     'assets/imgs/visa-number.png',
//                     () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AddCardScreen(
//                                     courseTitle: widget.courseTitle,
//                                     courseCode: widget.courseCode,
//                                     courseUnit: widget.courseUnit,
//                                   )));
//                     },
//                   ),
//                   opensansText(
//                       '................................................................',
//                       20.0,
//                       HexColor("#B39981").withOpacity(0.5)),
//                   imagelistTile(
//                     'assets/imgs/mastercard 1.png',
//                     'assets/imgs/mastercard-number.png',
//                     () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AddCardScreen(
//                                     courseTitle: widget.courseTitle,
//                                     courseCode: widget.courseCode,
//                                     courseUnit: widget.courseUnit,
//                                   )));
//                     },
//                   )
//                 ])
//               ]),
//         ),
//       ),
//     );
//   }
// }
