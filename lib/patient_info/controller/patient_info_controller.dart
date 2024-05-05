
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PatientInController extends GetxController {


  RxList<String> text = [
    '1025633349',
    '05233470057',
    'SaraMohammed1r@gmail.com',
    'Female',
    '22 Years old',
    'Performance'
  ].obs;
  RxList<IconData> icons = [
    Icons.contact_mail,
    Icons.call,
    Icons.mail,
    Icons.transgender,
    Icons.calendar_month,
    Icons.analytics_outlined,
  ].obs;

}
