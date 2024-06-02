import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lautech_mobile/colors/colors.dart';
import 'package:lautech_mobile/utils/app_bar.dart';
import 'package:lautech_mobile/utils/texts/sourcesans_text.dart';

class ReadingManualScreen extends StatefulWidget {
  const ReadingManualScreen({super.key});

  @override
  State<ReadingManualScreen> createState() => _ReadingManualScreenState();
}

class _ReadingManualScreenState extends State<ReadingManualScreen> {
  get future => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: centerAlignedAppBar(context, 'Reading Manual'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          decoration: BoxDecoration(
              color: HexColor("#F1EEEE"),
              borderRadius: BorderRadius.circular(21)),
          child: Column(
            children: [
              Image.asset(
                'assets/imgs/manual_coverimg.png',
                width: 310,
                height: 197,
              ),
              SizedBox(height: 20),
              FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    return sourceSansText(
                        'A book is a medium for recording information in the form of writing or images, typically composed of many pages bound together and protected by a cover. It can also be a handwritten or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers',
                        16.0,
                        colorCodes.black);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
