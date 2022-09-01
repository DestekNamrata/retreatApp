import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Screens/Agenda/agenda_screen.dart';
import 'package:flutter_app/Screens/Agenda/agenda_screen_old.dart';
import 'package:flutter_app/Screens/Breather/breather_screen.dart';
import 'package:flutter_app/Screens/Conference/conference_screen.dart';
import 'package:flutter_app/Screens/Infobeats/infobeats_screen.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/Profile/ticket_screen.dart';
import 'package:flutter_app/Screens/Profile/yours_ticket_screen.dart';
import '../sos_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgList = [
    Image.asset(Images.agendaImage),
    Image.asset(Images.unconfImage),
    Image.asset(Images.inforteImage),
    Image.asset(Images.breatherImage),
    Image.asset(Images.travelImage)
  ];

  Future<bool> _exitApp(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: new Text('Do you want to exit ?'),
                actions: <Widget>[
                  // Container(
                  //   height: 60.0,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xff8018BB),
                  //
                  //     borderRadius: BorderRadius.only(
                  //         bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                  //   ),
                  //   child:
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(child: Text("Cancel",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Inter-SemiBold',
                  //       fontWeight: FontWeight.w600),)),
                  //       // Text("|",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                  //       Container(
                  //         margin: EdgeInsets.only(top: 10,bottom: 10.0),
                  //         child: VerticalDivider(
                  //
                  //           color: Colors.white,
                  //           thickness: 1,
                  //         ),
                  //       ),
                  //       Expanded(child:Text("OK",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'Inter-SemiBold',
                  //           fontWeight: FontWeight.w600),))
                  //     ],
                  //   ),
                  // )
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  FlatButton(
                    // onPressed: () => Navigator.of(context).pop(true),
                    onPressed: () => exit(0), //updated on 12/02/2021
                    child: new Text('Yes'),
                  ),
                ],
              );
            }) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        // appBar:
        // AppBar(
        //   title:
        //   Text(
        //     "Home",
        //     textAlign: TextAlign.left,
        //     style: TextStyle(
        //         fontFamily: 'Poppins',
        //         fontWeight: FontWeight.w500,
        //         fontSize: 18.0,
        //         color: AppTheme.textColor),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   actions: [
        //
        //     Row(
        //       children: [
        //         InkWell(
        //             onTap: (){
        //               Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSScreen()));
        //             },
        //             child:Container(
        //                 width: 55.0,
        //                 decoration: BoxDecoration(
        //                   // border: Border.all(color: Colors.black),
        //                   borderRadius: BorderRadius.circular(5.0),
        //                  color: Colors.grey
        //                 ),
        //                 child:Padding(
        //                     padding: EdgeInsets.all(3.0),
        //                     child:Text(textAlign: TextAlign.center,"SOS",style: TextStyle(color: AppTheme.appColor,fontWeight: FontWeight.w500,fontSize: 14.0),))
        //             )),
        //
        //         InkWell(
        //             onTap: () {
        //             },
        //             child: Stack(children: [
        //               // IconButton(
        //               //   icon:
        //               Image.asset(
        //                 Images.notifi,
        //                 width: 25.0,
        //                 height: 25.0,
        //               ),
        //               // tooltip: "Save Todo and Retrun to List",
        //               //   onPressed: () {},
        //               // ),
        //               Positioned(
        //                 right: 5,
        //                 top: 1,
        //                 child: new Container(
        //                   padding: EdgeInsets.all(1),
        //                   decoration: new BoxDecoration(
        //                     color: Colors.red,
        //                     borderRadius: BorderRadius.circular(8.5),
        //                   ),
        //                   constraints: BoxConstraints(
        //                     minWidth: 17,
        //                     minHeight: 4,
        //                   ),
        //                   child: Text(
        //                     "0",
        //                     style: new TextStyle(
        //                         color: Colors.white,
        //                         fontSize: 10,
        //                         fontWeight: FontWeight.w400,
        //                         fontFamily: 'Poppins'
        //                     ),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                 ),
        //               ),
        //               // if(Application.user.userType=="1")//for fleet
        //               // Positioned(
        //               //   right: 5,
        //               //   top: 5,
        //               //   child: new Container(
        //               //     padding: EdgeInsets.all(1),
        //               //     decoration: new BoxDecoration(
        //               //       color: Colors.red,
        //               //       borderRadius: BorderRadius.circular(8.5),
        //               //     ),
        //               //     constraints: BoxConstraints(
        //               //       minWidth: 17,
        //               //       minHeight: 17,
        //               //     ),
        //               //     child: Text(
        //               //       "0",
        //               //       style: new TextStyle(
        //               //           color: Colors.white,
        //               //           fontSize: 10,
        //               //           fontWeight: FontWeight.w400,
        //               //           fontFamily: 'Poppins'
        //               //       ),
        //               //       textAlign: TextAlign.center,
        //               //     ),
        //               //   ),
        //               // )
        //             ],
        //             )),
        //         //profile
        //         InkWell(
        //             onTap: () {
        //               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.only(right: 5.0),
        //               child: Image.asset(
        //                 Images.account,
        //                 width: 25.0,
        //                 height: 25.0,
        //               ),
        //             )
        //
        //         ),
        //
        //       ],
        //     )
        //   ],
        // ),
        //
        // extendBody: true,
        body: SafeArea(
          child: Column(

            children: [
              //for home top UI
              Container(
                height: 350.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage(Images.homeTop), fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            Images.logo,
                            height: 120.0,
                            width: 120.0,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SOSScreen()));
                                  },
                                  child: Container(
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                      child: Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "SOS",
                                            style: TextStyle(
                                                color: AppTheme.appColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0),
                                          )))
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Stack(
                                    children: [
                                      // IconButton(
                                      //   icon:
                                      Image.asset(
                                        Images.notifiHome,
                                        width: 22.0,
                                        height: 22.0,
                                      ),
                                      // tooltip: "Save Todo and Retrun to List",
                                      //   onPressed: () {},
                                      // ),
                                      Positioned(
                                        right: 0,
                                        top: 0,
                                        child: new Container(
                                          padding: EdgeInsets.all(1),
                                          decoration: new BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(8.5),
                                          ),
                                          constraints: BoxConstraints(
                                            minWidth: 15,
                                            minHeight: 4,
                                          ),
                                          child: Text(
                                            "0",
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Inter-Regular'),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              //profile
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Image.asset(
                                      Images.account,
                                      width: 25.0,
                                      height: 25.0,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Text("An event To",style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',
                          fontSize: 14.0,color: Colors.white),),
                      SizedBox(height: 8.0,),

                      //text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CONNECT",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter-Bold',
                          fontSize: 25.0,color: Colors.white),),
                          Text("COLLABORATE",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter-Bold',
                              fontSize: 25.0,color: Colors.white),),
                          Text("CELEBRATE",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Inter-Bold',
                              fontSize: 25.0,color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 250.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:ListView.builder
                    (
                    scrollDirection: Axis.horizontal,
                      itemCount: imgList.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return  Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: InkWell(
                                       onTap: (){
                                         if(index==0){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>AgendaScreen()));

                                         }else if(index==1){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ConferenceScreen()));
                                         }else if(index==2){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>InfobeatsScreen()));

                                         }else if(index==3){
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>BreatherScreen()));

                                         }else {
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>YoursTicketScreen()));

                                         }
                                       },
                                         child:Container(width: 150, height: 150, child: imgList[index])),
                                   );
                      }
                  )

                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              //   child:
              //   Column(
              //         children: [
              //           InkWell(
              //             onTap:(){
              //               Navigator.push(context, MaterialPageRoute(builder: (context)=>AgendaScreen()));
              //             },
              //               child:Container(
              //             height: 160,
              //             width: MediaQuery.of(context).size.width,
              //             decoration: BoxDecoration(
              //               color: Colors.grey,
              //               borderRadius: BorderRadius.circular(5),
              //               //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
              //               // fit: BoxFit.fill
              //               //   )
              //             ),
              //             child:
              //               Align(
              //                 alignment: Alignment.center,
              //                   child:Text("Agenda",textAlign: TextAlign.center,)),
              //
              //           )),
              //           SizedBox(height: 10.0,),
              //
              //           Row(
              //             children: [
              //               //conference
              //               Expanded(child:
              //               InkWell(
              //                   onTap:(){
              //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>ConferenceScreen()));
              //                   },
              //                   child:Container(
              //                 height: 160,
              //                 width: MediaQuery.of(context).size.width,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey,
              //                   borderRadius: BorderRadius.circular(5),
              //               //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
              //               // fit: BoxFit.fill
              //               //   )
              //                 ),
              //
              //                 child:
              //                 Align(
              //                     alignment: Alignment.center,
              //                     child:Text("Conference")),
              //
              //               ))),
              //               SizedBox(width: 15.0,),
              //
              //               //info beats
              //               Expanded(child:
              //               InkWell(
              //                   onTap:(){
              //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>InfobeatsScreen()));
              //                   },
              //                   child:Container(
              //                 height: 160,
              //                 width: MediaQuery.of(context).size.width,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey,
              //                   borderRadius: BorderRadius.circular(5),
              //                   //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
              //                   // fit: BoxFit.fill
              //                   //   )
              //                 ),
              //                 child:
              //                 Align(
              //                     alignment: Alignment.center,
              //                     child:Text("Infobeats")),
              //
              //               )))
              //             ],
              //           ),
              //           SizedBox(height: 10.0,),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               //conference
              //               Expanded(child: Container(
              //                 height: 160,
              //                 width: MediaQuery.of(context).size.width,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey,
              //                   borderRadius: BorderRadius.circular(5),
              //                   //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
              //                   // fit: BoxFit.fill
              //                   //   )
              //                 ),
              //                 child:
              //                 Align(
              //                     alignment: Alignment.center,
              //                     child:Text("Breakout rooms",textAlign: TextAlign.center,)),
              //
              //               )),
              //               SizedBox(width: 15.0,),
              //               //info beats
              //               Expanded(child:
              //               InkWell(
              //                 onTap: (){
              //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));
              //                 },
              //                   child:Container(
              //                 height: 160,
              //                 width: MediaQuery.of(context).size.width,
              //                 decoration: BoxDecoration(
              //                   color: Colors.grey,
              //                   borderRadius: BorderRadius.circular(5),
              //                   //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
              //                   // fit: BoxFit.fill
              //                   //   )
              //                 ),
              //                 child:
              //                 Align(
              //                     alignment: Alignment.center,
              //                     child:Text("Tickets")),
              //
              //               )))
              //             ],
              //           ),
              //
              //         ],
              //       )),
            ],
          ),
        ),
      ),
    );
  }
}
