import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/bottomNav/bottomnav_bar.dart';
import 'package:lautech_mobile/screens/home/assignment/assignment_fle_screen.dart';
import 'package:lautech_mobile/screens/home/dashboard/searchtextfield_row.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorCodes.white,
        surfaceTintColor: colorCodes.white,
        centerTitle: true,
        title: opensansText('Assignment', 20.0, HexColor("#1A284B"),
            fontWeight: FontWeight.w600),
      ),
      backgroundColor: colorCodes.white,
      extendBody: true,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                height: 19,
              ),
              Container(
                height: 35,
                // width: 343,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(color: HexColor("#905F32")),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sourceSansText('All Assignments', 20.0, colorCodes.white,
                        fontWeight: FontWeight.w600),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/imgs/sort-bold.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return assignmentContainer(
                        'CSC 202 Assignment',
                        '-submitted',
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AssignmentFileScreen()));
                        },
                      );
                    }),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget assignmentContainer(assignment, assignmentStatus, assignmentFunc) {
    return Column(
      children: [
        InkWell(
          onTap: assignmentFunc,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sourceSansText(assignment, 16.0, HexColor("#091031")),
              sourceSansText(
                  assignmentStatus,
                  16.0,
                  assignmentStatus == '-submitted'
                      ? HexColor("#DFAF04")
                      : assignmentStatus == '-pending'
                          ? HexColor("#FF4D00")
                          : HexColor("#319103"),
                  fontWeight: FontWeight.w700),
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
