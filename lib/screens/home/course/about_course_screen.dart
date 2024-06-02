// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:lautech_mobile/colors/colors.dart';
// import 'package:lautech_mobile/utils/backnav_row.dart';
// import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

// class AboutCourseScreen extends StatefulWidget {
//   const AboutCourseScreen({super.key});

//   @override
//   State<AboutCourseScreen> createState() => _AboutCourseScreenState();
// }

// class _AboutCourseScreenState extends State<AboutCourseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: colorCodes.white,
//         body: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//             image: AssetImage('assets/imgs/background-image.png'),
//           )),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 30),
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//               children: [
//                 Column(children: [
//                   backNavRow(
//                     context,
//                     'About this Book',
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   sourceSansText(
//                     "A book is a medium for recording information in the form of writing or images,typically composed of many pages bound together and protected by a cover. It can also be a handwritten or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers ...",
//                     20.0,
//                     colorCodes.black,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   sourceSansText(
//                     "A book is a medium for recording information in the form of writing or images,typically composed of many pages bound together and protected by a cover.",
//                     20.0,
//                     colorCodes.black,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     children: [
//                       titleDescr('Language', 'English'),
//                       SizedBox(
//                         width: 71,
//                       ),
//                       titleDescr('Author', 'Prof. M.O Oke')
//                     ],
//                   ),
//                   SizedBox(
//                     height: 23,
//                   ),
//                   Row(
//                     children: [
//                       titleDescr('Published on', 'Dec. 5 2023'),
//                       SizedBox(
//                         width: 71,
//                       ),
//                       titleDescr('ISBN', '897865747577457')
//                     ],
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         ));
//   }

//   titleDescr(title, descr) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 117,
//           child: sourceSansText(title, 20.0, HexColor("#091031"),
//               fontWeight: FontWeight.w600),
//         ),
//         SizedBox(
//           height: 5,
//         ),
//         SizedBox(
//           width: 120,
//           child: sourceSansText(
//             descr,
//             15.0,
//             HexColor("#091031"),
//           ),
//         )
//       ],
//     );
//   }
// }
