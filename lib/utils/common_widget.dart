import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/app/constant.dart';

class CommonWidget {
  static Widget headText(String text,
      {FontWeight fontWeight = FontWeight.w600, double fontSize = 40}) {
    return Text(
      text,
      style: TextStyle(
        color: kWhiteColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(4.0, 4.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
              )
        ],
      ),
    );
  }

  static Widget bodyText(String text,
      {FontWeight fontWeight = FontWeight.normal, double fontSize = 18}) {
    return Text(
      text,
      style: TextStyle(
        color: kWhiteColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        shadows: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(4.0, 4.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
              )
        ],
      ),
    );
  }

  static Widget imageAsset(String image) {
    return SimpleShadow(
      child: Image.asset(image),
      opacity: 0.7, // Default: 0.5
      color: Colors.black38, // Default: Black
      offset: Offset(5, 5), // Default: Offset(2, 2)
      sigma: 3, // Default: 2
    );
  }
}
