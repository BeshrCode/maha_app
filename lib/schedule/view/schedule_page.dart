import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';
import '../controller/schedule_controller.dart';

class SchedulePage extends GetWidget<ScheduleController> {
  const SchedulePage({super.key});


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

        const SizedBox(height: 20),
        _list(),
      ],
    );
  }
  Expanded _list(){
    return Expanded(
      flex: 3,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(width :0,height:20);
        },
        itemCount: 10, itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: index.isEven?true:false,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                     SizedBox(width: 10,height:50,),
                    Text(
                      'Today, 15 Nov',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter'
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                    offset: const Offset(0, 0), // changes the position of the shadow
                  ),
                ],
              ),
              child: ListTile(
                  title: const Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.userLarge,color: Color(0xff9EA1BF),size: 30),
                          SizedBox(width: 20,),
                          Text(
                            'Sara Mohammed',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle:Column(
                    children: [
                      const SizedBox(height: 20,),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(text: 'Date : ', style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter',fontSize: 16)),
                            TextSpan(text: 'Sunday 15 Nov  ', style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Inter',fontSize: 15)),

                            TextSpan(text: 'Time : ', style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter',fontSize: 16)),
                            TextSpan(text: ' 01:30 PM', style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Inter',fontSize: 15)),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: index==0?true:false,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          width: 100,
                          height: 32,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color(0xffBAC5FC))
                              ),
                              onPressed: () {

                              }, child: const Text('Start',style: TextStyle(color: Colors.white),)),
                        ),
                      )
                    ],
                  )

              ),
            ),
          ],
        );
      },),
    );
  }

}
