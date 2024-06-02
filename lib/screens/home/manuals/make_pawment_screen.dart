import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/screens/home/manuals/payment_processed_screen.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/texts/opensans_text.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Make Payment'),
      backgroundColor: HexColor("#E9E9E9"),
      body: ListView(
        padding: EdgeInsets.only(bottom: 30),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Container(
                //   height: 50,
                // ),
                Positioned(
                  bottom: 50,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentProcessedScreen()));
                    },
                    child: Container(
                      height: 41,
                      width: 163,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor("#905F32"),
                      ),
                      child: opensansText(
                        'Paid? Yes',
                        20.0,
                        colorCodes.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
