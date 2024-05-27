import 'package:flutter/material.dart';
import 'package:lautech_mobile/colors/colors.dart';

Widget imagelistTile(imgone, imgtwo, func, {tirdWidget, trailingWidget}) {
  return ListTile(
    onTap: func,
    tileColor: colorCodes.white,
    selectedColor: colorCodes.white,
    title: Row(
      children: [
        Image.asset(
          imgone,
          height: 61,
          width: 70,
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          imgtwo,
          height: 39,
          width: 130,
        ),
        // tirdWidget
        //     ? SizedBox(
        //         width: 8,
        //       )
        //     : SizedBox(
        //         width: 0,
        //       ),
        tirdWidget ??
            SizedBox(
              height: 20,
            ),
      ],
    ),
    trailing: trailingWidget ??
        Image.asset(
          'assets/imgs/icon/arrow-forwrd.png',
          height: 20,
          width: 20,
        ),
  );
}
