import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:tw_weather/app/constant.dart';

class CommonWidget {
  static Widget headText(String text,
      {FontWeight fontWeight = FontWeight.w600,
      double fontSize = 40,
      Color color = kWhiteColor}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
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
      {FontWeight fontWeight = FontWeight.normal,
      double fontSize = 18,
      Color color = kWhiteColor}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
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

//Moon cloud fast wind.png
  static Widget imageAsset(String weatherType,
      {Color color = Colors.black38,
      double opacity = 0.7,
      double dx = 5,
      double dy = 5,
      double sigma = 3}) {
    String image = '';
    kWeatherType.forEach((key, value) {
      List data = value['value'] as List<String>;
      data.forEach((element) {
        if (element == weatherType) {
          image = value['image'] as String;
        }
      });
    });
    return SimpleShadow(
      child: Image.asset(image),
      opacity: opacity, // Default: 0.5
      color: color, // Default: Black
      offset: Offset(dx, dy), // Default: Offset(2, 2)
      sigma: sigma, // Default: 2
    );
  }

  static Widget cardWidget(
      {required double height,
      required double width,
      required Color color,
      required Widget widget,
      double radius = 15}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(4.0, 4.0), //陰影y軸偏移量
              blurRadius: 5, //陰影模糊程度
              spreadRadius: 1 //陰影擴散程度
              )
        ],
      ),
      child: widget,
    );
  }
}
