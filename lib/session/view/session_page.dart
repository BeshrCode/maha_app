import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:malath_sara/app_pages.dart';

import '../../theme/colors.dart';
import '../controller/session_controller.dart';


class SessionPage extends GetWidget<SaraSessionController> {
  const SessionPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(onPressed: () {
                controller.showFilterDialog(context); // Show the filter dialog
              }, icon: const Icon(Icons.filter_list)),
              const Text('Filter', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              )),
            ],
          ),
          _list(),
        ],
      ),
    );
  }

  Expanded _list() {
    return Expanded(
      flex: 3,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 0, height: 5);
        },
        itemCount: 10, itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: const Offset(
                          0, 0), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 8,
                        child: Text(
                          'Sara Mohammed',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppPages.schedulePage);
                              },
                              child: Container(
                                height: 35,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xffD7C4FC)
                                ),
                                child: const Center(
                                  child: FaIcon(FontAwesomeIcons.check,
                                    color: Color(0xff6251A2),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            InkWell(
                              onTap: () {
                                Get.snackbar('Decline', 'Declined Success');
                              },
                              child: Container(
                                height: 35,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xffD7C4FC)
                                ),
                                child: const Center(
                                  child: FaIcon(FontAwesomeIcons.close,
                                    color: Color(0xff6251A2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],),
                )
            ),
          ],
        );
      },),
    );
  }

}
