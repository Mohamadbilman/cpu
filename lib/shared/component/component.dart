import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget topContainer({
  required String text,
  required var width,
}) =>
    Container(
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(top: 10, start: 20, end: 20),
      height: 60,
      width: width,
      decoration: BoxDecoration(
          color: HexColor("#28A745"), borderRadius: BorderRadius.circular(5)),
      child: Text(text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
    );

Widget defaultButton(
        {required var width,
        required var color,
        required var function,
        required var text}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        width: width,
        child: MaterialButton(
          splashColor: Colors.yellow,
          elevation: 0.0,
          color: color,
          onPressed: function,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

my_AppBar({var leading}) => AppBar(
      title: const Center(
          child: Text(
        'الخدمات الطلابية لجامعة قرطبة الخاصة _ القامشلي',
        style: TextStyle(fontSize: 15),
      )),
      leading: leading,
      backgroundColor: HexColor("#006134"),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);
