import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:malath_sara/home_patients_page.dart';
import 'package:malath_sara/patient_info/binding/patient_info_binding.dart';
import 'package:malath_sara/patient_info/view/patient_info_page.dart';
import 'package:malath_sara/schedule/binding/schedule_binding.dart';
import 'package:malath_sara/schedule/controller/schedule_controller.dart';
import 'package:malath_sara/schedule/view/schedule_page.dart';
import 'package:malath_sara/session/binding/session_binding.dart';
import 'package:malath_sara/session/view/session_page.dart';

import 'my_patients/binding/my_patients_binding.dart';
import 'my_patients/view/my_patients_page.dart';

class AppPages{
  static String homePatientsPage = '/homePatientsPage';
  static String my_patients_Page = '/my_patients_Page';
  static String patient_info_page = '/patient_info_page';
  static String schedulePage = '/schedulePage';
  static String sessionPage = '/sessionPage';
  static final List<GetPage<dynamic>>appPages = [

    GetPage(
      binding: PatientInfoBinding(),
      name: patient_info_page, page: () {
      return const PatientInfoPage();
    },),
    GetPage(
      binding: SaraSessionBinding(),
      name: sessionPage, page: () {
      return const SessionPage();
    },),
    GetPage(
      binding: scheduleBinding(),
      name: schedulePage, page: () {
      return const SchedulePage();
    },),

    GetPage(
      binding: MyPatientsBinding(),
      name: my_patients_Page, page: () {
      return  const MyPatientsPage();
    },),
    GetPage(
      bindings: [MyPatientsBinding(),scheduleBinding()],
      name: homePatientsPage, page: () {
      return  const HomePatientsPage();
    },),
  ];
}