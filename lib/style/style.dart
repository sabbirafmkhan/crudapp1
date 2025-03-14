import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const colorRed = Color.fromRGBO(216, 64, 64, 1);
const colorGreen = Color.fromRGBO(137, 172, 70, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(45, 51, 107, 1);

// application screen background function:
screenBackground(context) {
  return SvgPicture.asset(
    "assets/images/screen-back.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

// application input decoration:
InputDecoration appInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen, width: 1.0),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0),
    ),
    border: OutlineInputBorder(),
    labelText: label,
  );
}

// application dropdown decoration:
DecoratedBox appDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorWhite, width: 1),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(padding: EdgeInsets.only(left: 30, right: 30), child: child),
  );
}

// application Button decoration:
ButtonStyle appButtonStyle() {
  return ButtonStyle();
}
