import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class JsonAnimation {
  static Widget loadAnimation({double height = 100, double width = 100}) {
    return SizedBox(
      height: height,
      width: width,
      child: Lottie.asset(
        'assets/animation/8707-loading.json',
        repeat: true,
      ),
    );
  }
}
