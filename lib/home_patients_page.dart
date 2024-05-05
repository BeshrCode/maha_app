import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:malath_sara/schedule/controller/schedule_controller.dart';
import 'package:malath_sara/theme/colors.dart';

import 'my_patients/controller/my_patients_controller.dart';

class HomePatientsPage extends GetWidget<MyPatientsController> {
  const HomePatientsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: const Text('Hi, Dr. Abdullah',style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: Color(0xff321F5C)
          ),),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 10,
              ),
              child: InkWell(
                onTap: () {
                },
                child: const Icon(Icons.settings),
              ),
            ),
          ],
          surfaceTintColor: bgColor,
          backgroundColor: bgColor,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10,),
            SizedBox(
                height:30,
                child: _topList()),
            Obx(() {
              return Expanded(
                  flex: 9,
                  child: controller.pages[controller.selectedIndex.value]);
            })
          ],
        )
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30, // Fixed height for the top list
          child: _topList(),
        ),
        const SizedBox(height: 10),
        const Divider(),

        const SizedBox(height: 20),
      ],
    );
  }


  Widget _topList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.items.length,
              physics: const NeverScrollableScrollPhysics(),
              // Disable scrolling
              shrinkWrap: true,
              // Allow the ListView to take only the space it needs
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectItem(index);
                  },
                  child: Obx(() {
                    return Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        color: controller.selectedIndex == index ? const Color(
                            0xffD7C4FC) : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      // Center the text inside the container
                      child: Text(
                        controller.items[index],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: controller.selectedIndex == index ? Colors
                              .white : const Color(0xffBAC5FC),
                        ),
                      ),
                    );
                  }),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
            ),
      );
  }

}
