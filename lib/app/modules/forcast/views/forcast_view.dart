import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forcast_controller.dart';

class ForcastView extends GetView<ForcastController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForcastView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForcastView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
