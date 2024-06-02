import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget searchtextfieldRow(searchcontroller, searchBtnFunc, filterFunc,
    {width}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      searchtetField('Search', searchcontroller, searchBtnFunc, width: width),
      InkWell(
        onTap: filterFunc,
        child: Container(
          height: 44,
          width: 44,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: HexColor("#2A71B0").withOpacity(0.1)),
          child: Image.asset(
            'assets/imgs/icon/filter list.png',
            height: 24,
            width: 24,
          ),
        ),
      )
    ],
  );
}

Widget searchtetField(hintText, searchcontroller, searchBtnFunc, {width}) {
  return Container(
    height: 45,
    width: width ?? 274,
    decoration: BoxDecoration(
      color: HexColor("#F4F6F9"),
      borderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
    ),
    child: TextField(
      controller: searchcontroller,
      autocorrect: true,
      //autofocus: true,
      // obscureText: obscure,
      enableSuggestions: true,
      style: TextStyle(
          fontFamily: 'Source Sans 3',
          color: HexColor("#1A284B").withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.w400),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        // fillColor: HexColor("#FAF8F7"),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            onTap: searchBtnFunc,
            child: Image.asset(
              'assets/imgs/icon/search.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: 'Source Sans 3',
            color: HexColor("#09101D"),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        // prefixIcon: Icon(Icons.email, color: Colors.grey[400]),
        contentPadding: const EdgeInsets.only(top: 16, left: 20),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}
