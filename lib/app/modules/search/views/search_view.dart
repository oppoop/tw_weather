import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) {
          return Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomRight,
                    image: AssetImage('assets/image/search_back.png')),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      child: Text(
                        'Pick a location',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: Get.width * 0.7,
                      child: Text(
                        'Type the area or city you want to know the detailed weather information at this time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kWhiteColor, fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    searchBlock(),
                    featureCity(),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  Widget searchBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 65,
          width: Get.width * 0.6,
          decoration: BoxDecoration(
              color: CardColor, borderRadius: BorderRadius.circular(20)),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: controller.textEditingController,
            focusNode: controller.focusNode,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: kWhiteColor),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                color: kWhiteColor,
              ),
            ),
          ).paddingOnly(left: 20),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 65,
            width: Get.width * 0.15,
            decoration: BoxDecoration(
                color: CardColor, borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.location_on,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget featureCity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  color: selectColor, borderRadius: BorderRadius.circular(15)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  color: CardColor, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 300,
              width: 120,
              decoration: BoxDecoration(
                  color: CardColor, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
      ],
    );
  }
}
