import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(216, 64, 64, 1);
const colorGreen = Color.fromRGBO(137, 172, 70, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(45, 51, 107, 1);

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
