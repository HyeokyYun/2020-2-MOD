import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 25),
      children: <TextSpan>[
        TextSpan(
            text: 'E',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        TextSpan(
            text: 'du',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        TextSpan(
            text: 'K',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w600, color: Colors.red)),
        TextSpan(
            text: 'i',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.amberAccent[700])),
        TextSpan(
            text: 'd',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red)),
      ],
    ),
  );
}

Widget appBarUser(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 25),
      children: <TextSpan>[
        TextSpan(
            text: 'E',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        TextSpan(
            text: 'du',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
        TextSpan(
            text: 'K',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w600, color: Colors.red)),
        TextSpan(
            text: 'i',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.amberAccent[700])),
        TextSpan(
            text: 'd',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red)),
        TextSpan(
            text: '(Guest Mode)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            )),
      ],
    ),
  );
}

Widget blueButton({BuildContext context, String label, buttonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(30),
    ),
    height: 50,
    alignment: Alignment.center,
    width: buttonWidth != null
        ? buttonWidth
        : MediaQuery.of(context).size.width - 10,
    child: Text(
      label,
      style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
    ),
  );
}
