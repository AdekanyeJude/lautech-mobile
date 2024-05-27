import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/course/review_summary_screen.dart';
import 'package:lautech_mobile/utils/backnav_row.dart';
import 'package:lautech_mobile/utils/button/auth_btn.dart';
import 'package:lautech_mobile/utils/textfield/name_textfield.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen(
      {super.key,
      required this.courseTitle,
      required this.courseCode,
      required this.courseUnit});
  final courseTitle, courseCode, courseUnit;

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController cardNumController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController dateofbirthController = TextEditingController();
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                children: [
                  Column(
                    children: [
                      backNavRow(
                        context,
                        'Add New',
                        trailingWidget: InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/imgs/icon/scan.png',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/imgs/card-img.png',
                        height: 290,
                        width: 544,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          opensansText(
                            'Card Number',
                            20.0,
                            HexColor("#091031"),
                            fontWeight: FontWeight.w600,
                          ),
                          textFieldUsername('', '', true, cardNumController,
                              keyboard: TextInputType.number),
                          SizedBox(
                            height: 10,
                          ),
                          opensansText(
                            'Full Name',
                            20.0,
                            HexColor("#091031"),
                            fontWeight: FontWeight.w600,
                          ),
                          textFieldUsername(
                            '',
                            '',
                            true,
                            cardNameController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cvvTextFieldColumn('Expiry Date',
                                  dateofbirthController, TextInputType.none,
                                  onTap: showDate),
                              cvvTextFieldColumn(
                                  'cvv', cvvController, TextInputType.number,
                                  maxLength: 3)
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: authButton('Add', () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReviewSummaryScreen(
                                          courseTitle: widget.courseTitle,
                                          courseCode: widget.courseCode,
                                          courseUnit: widget.courseUnit)));
                            }),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }

  showDate() async {
    DateTime? dateofBirth = await showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(Duration(days: 15 * 365)),
        firstDate: DateTime(1930),
        lastDate: DateTime.now().subtract(
            Duration(days: 4745))); //.subtract(Duration(days: 15 * 365))
    if (dateofBirth != null) {
      setState(() {
        dateofbirthController.text =
            DateFormat('dd/MM/yyyy').format(dateofBirth);
      });
    }
  }

  cvvTextFieldColumn(descr, controller, keyboard, {onTap, maxLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        opensansText(
          descr,
          20.0,
          HexColor("#091031"),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          width: 148,
          child: textFieldUsername(
            '',
            '',
            false,
            controller,
            keyboard: keyboard,
            onTap: onTap,
            maxLength: maxLength,
          ),
        ),
      ],
    );
  }
}
