import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_weather/app/constant.dart';
import 'package:tw_weather/app/modules/index/controllers/index_controller.dart';

class BottomNavBar extends StatelessWidget {
  final controller = Get.find<IndexController>();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: bottomColor,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(500), topLeft: Radius.circular(500))),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: Icons.home,
                  selected: controller.currentIndex.value == IndexPage.Home
                      ? true
                      : false,
                  onPressed: () =>
                      controller.currentIndex.value = IndexPage.Home),
              IconBottomBar(
                  text: "Search",
                  icon: Icons.search_outlined,
                  selected: controller.currentIndex.value == IndexPage.Search
                      ? true
                      : false,
                  onPressed: () =>
                      controller.currentIndex.value = IndexPage.Search),
              IconBottomBar(
                  text: "Favorite",
                  icon: Icons.favorite_border,
                  selected: controller.currentIndex.value == IndexPage.Favorite
                      ? true
                      : false,
                  onPressed: () =>
                      controller.currentIndex.value = IndexPage.Favorite),
              IconBottomBar(
                  text: "Settings",
                  icon: Icons.settings,
                  selected: controller.currentIndex.value == IndexPage.Setting
                      ? true
                      : false,
                  onPressed: () =>
                      controller.currentIndex.value = IndexPage.Setting)
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? kWhiteColor : IconColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12, height: .1, color: IconColor),
        )
      ],
    );
  }
}
