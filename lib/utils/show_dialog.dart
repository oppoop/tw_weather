import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'json_animation.dart';

class ShowDialog {
  static Future<void> dialogLoading(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 100,
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  child: Center(
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: JsonAnimation.loadAnimation(),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<void> dialogSuccess(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierColor: Colors.black38,
        builder: (BuildContext context) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 100,
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                insetPadding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  height: 100,
                  child: Center(
                      child: Icon(
                    Icons.assignment_turned_in,
                    color: Colors.green,
                    size: 30,
                  )),
                ),
              ),
            ),
          );
        });
  }
}
