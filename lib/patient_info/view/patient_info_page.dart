import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/patient_info_controller.dart';

class PatientInfoPage extends GetWidget<PatientInController> {
  const PatientInfoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {

          }, icon:const Icon( Icons.settings)),
          const SizedBox(width: 20,),
        ],

      ),
      body: Column(
        children: <Widget>[
           const SizedBox(height: 20,),
          _info(),
          const SizedBox(height: 50,),

          Expanded(
            child: ListView.builder(
              itemCount: controller.text.length,
              itemBuilder: (BuildContext context, int index) {
                return _item(controller.text[index],controller.icons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _item(String text,IconData iconData) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          padding: const EdgeInsets.all(10),
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
          child:  Row(
            children: [
              Icon(iconData),
               const SizedBox(width: 20,),
              Text(text,style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                color: Color(0xff494949)
              ),),
              const Spacer(),
              Visibility(
                visible:text=='Performance' ,
                child: InkWell(
                    onTap: () {

                    },
                    child: const Text('View',style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),)),
              )
            ],
          ),
        );
  }

  Container _info() {
    return Container(
      height: 80,
          padding: const EdgeInsets.all(10),
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
          child: const Row(children: [
            FaIcon(FontAwesomeIcons.userLarge,color: Color(0xff9EA1BF),size: 40,),
             SizedBox(width: 20,),
            Text(
              'Sara Mohammed',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],)
        );
  }
}
