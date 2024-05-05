import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../app_pages.dart';
import '../../theme/colors.dart';
import '../controller/my_patients_controller.dart';

class MyPatientsPage extends GetWidget<MyPatientsController> {
  const MyPatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Divider(),
        searchBar(),
        Row(
          children: [
            IconButton(
              onPressed: () {
                controller.showFilterDialog(context);
              },
              icon: const Icon(Icons.filter_list),
            ),
            const Text('Filter'),
          ],
        ),
        const SizedBox(height: 20),
        _list(),
      ],
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 20,
        bottom: 10,
      ),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurStyle: BlurStyle.normal,
            offset: Offset(-1, 2),
            spreadRadius: 0,
            blurRadius: 1,
          )
        ],
      ),
      child: ListTile(
        trailing: const FaIcon(
          FontAwesomeIcons.search,
          size: 20,
        ),
        subtitle: const Text(''),
        isThreeLine: true,
        title: TextField(
          onChanged: (value) {
            controller.filterList(value);
          },
          controller: controller.searchController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      flex: 7,
      child: Obx(() => ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10, height: 10);
        },
        itemCount: controller.filteredItems.isNotEmpty
            ? controller.filteredItems.length
            : controller.originalItems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Handle item tap here
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  controller.filteredItems.isNotEmpty
                      ? controller.filteredItems[index]
                      : controller.originalItems[index], // Use filtered items here
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Other ListTile properties...
              ),
            ),
          );
        },
      )),
    );
  }
}
