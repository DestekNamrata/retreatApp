import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AttendanceHistory extends StatefulWidget{
  _AttendanceState createState()=> _AttendanceState();
}

class _AttendanceState extends State<AttendanceHistory>{

  Widget getAttendanceList(){
    return
      ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, index) {
          return Container(
            // margin: EdgeInsets.only(left:5,right: 5,bottom:8.0),

            child: Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child:
                     Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Room No. 6",style: TextStyle(fontSize: 12.0),),
                            SizedBox(height: 5.0,),
                            Text("Excepteur sint ocatiplus non prodineent sunt",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),),
                            SizedBox(height: 5.0,),
                            Text("(1st september) Lorem ipsum dolor sit ecptier goongdjdh",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400),),
                            SizedBox(height: 5.0,),

                          ],
                        ),

                  ),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),

                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    ),
                    // color: Colors.grey.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child:
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text("Punch In",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0),),
                              Text("12:30 pm",textAlign: TextAlign.center,style:
                              TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                            ],
                          ),
                        ),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Expanded(child:
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text("Punch Out",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0),),
                              Text("2:30 pm",textAlign: TextAlign.center,style:
                              TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                            ],
                          ),
                        ),                              ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        //duration
                        Expanded(child:
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Text("Duration(hrs)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.0),),
                              Text("2:00",textAlign: TextAlign.center,style:
                              TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                            ],
                          ),
                        ),                              )
                      ],
                    ),
                  )
                ],
              ),

            ),
          );
        },
        itemCount:6,
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.of(context)!.translate("attendance")),
      ),
      body: SafeArea(
        child: getAttendanceList(),
      ),
    );
  }

}