import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../controllers/forcast_controller.dart';

class ForcastView extends GetView<ForcastController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          todayReport(),
        ],
      ),
    );
  }

  Widget todayReport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: kWhiteColor,
                  )),
            ),
            Text(
              'Forecast Report',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 50,
              height: 50,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Get.width * 0.5,
              child: Text(
                'Today',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ).paddingOnly(left: 30),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: Get.width * 0.5,
              child: Text(
                '7月 22,2021',
                style: TextStyle(color: kWhiteColor, fontSize: 15),
              ).paddingOnly(right: 30),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: Get.width,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return reportItem(index);
              }),
        ).paddingSymmetric(horizontal: 15),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Next Forecast',
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ).paddingOnly(left: 30),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: Get.height * 0.5,
          width: Get.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => forecastItem(),
          ),
        ),
      ],
    );
  }

  Widget reportItem(int index) {
    return Container(
      height: 90,
      width: 150,
      decoration: BoxDecoration(
          color: index == 0 ? selectColor : kDarkCardColor,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/image/Moon cloud fast wind.png'),
          ).paddingOnly(right: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10:00 AM',
                style:
                    TextStyle(color: index == 0 ? Colors.black : kWhiteColor),
              ).paddingOnly(bottom: 10),
              Text(
                '26 °C',
                style:
                    TextStyle(color: index == 0 ? Colors.black : kWhiteColor),
              )
            ],
          ),
        ],
      ),
    ).paddingOnly(right: 20);
  }

  Widget forecastItem() {
    return Align(
      child: Container(
        height: 100,
        width: Get.width * 0.85,
        decoration: BoxDecoration(
            color: CardColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              height: 90,
              width: Get.width * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tuesday',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '7月 23',
                    style: TextStyle(color: kWhiteColor, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: 90,
                width: Get.width * 0.25,
                child: Text('26 °C',
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w500))),
            Container(
                alignment: Alignment.center,
                height: 90,
                width: Get.width * 0.25,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/image/Moon cloud fast wind.png'),
                )),
          ],
        ),
      ),
    ).paddingOnly(bottom: 20);
  }
}
