import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Screens/Agenda/agenda_screen.dart';
import 'package:flutter_app/Screens/Conference/conference_screen.dart';
import 'package:flutter_app/Screens/Infobeats/infobeats_screen.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/Profile/ticket_screen.dart';
import '../sos_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _exitApp(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: new Text('Do you want to exit this application?'),
                actions: <Widget>[
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
          appBar:

          AppBar(
            title: Text(
              "Home",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: AppTheme.textColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSScreen()));
                      },
                      child:Container(
                          width: 55.0,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                           color: Colors.grey
                          ),
                          child:Padding(
                              padding: EdgeInsets.all(3.0),
                              child:Text(textAlign: TextAlign.center,"SOS",style: TextStyle(color: AppTheme.appColor,fontWeight: FontWeight.w500,fontSize: 14.0),))
                      )),

                  InkWell(
                      onTap: () {
                      },
                      child: Stack(children: [
                        // IconButton(
                        //   icon:
                        Image.asset(
                          Images.notifi,
                          width: 25.0,
                          height: 25.0,
                        ),
                        // tooltip: "Save Todo and Retrun to List",
                        //   onPressed: () {},
                        // ),
                        Positioned(
                          right: 5,
                          top: 1,
                          child: new Container(
                            padding: EdgeInsets.all(1),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 17,
                              minHeight: 4,
                            ),
                            child: Text(
                              "0",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins'
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // if(Application.user.userType=="1")//for fleet
                        // Positioned(
                        //   right: 5,
                        //   top: 5,
                        //   child: new Container(
                        //     padding: EdgeInsets.all(1),
                        //     decoration: new BoxDecoration(
                        //       color: Colors.red,
                        //       borderRadius: BorderRadius.circular(8.5),
                        //     ),
                        //     constraints: BoxConstraints(
                        //       minWidth: 17,
                        //       minHeight: 17,
                        //     ),
                        //     child: Text(
                        //       "0",
                        //       style: new TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 10,
                        //           fontWeight: FontWeight.w400,
                        //           fontFamily: 'Poppins'
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // )
                      ],
                      )),
                  //profile
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Image.asset(
                          Images.account,
                          width: 25.0,
                          height: 25.0,
                        ),
                      )

                  ),

                ],
              )
            ],
          ),

          extendBody: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                child: Column(
                  children: [
                    Container(),
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AgendaScreen()));
                      },
                        child:Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
                        // fit: BoxFit.fill
                        //   )
                      ),
                      child:
                        Align(
                          alignment: Alignment.center,
                            child:Text("Agenda",textAlign: TextAlign.center,)),

                    )),
                    // CachedNetworkImage(
                    //   filterQuality: FilterQuality.medium,
                    //   // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                    //   // imageUrl:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                    //   imageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                    //       ,
                    //   placeholder: (context, url) {
                    //     return Shimmer.fromColors(
                    //       baseColor: Theme.of(context).hoverColor,
                    //       highlightColor: Theme.of(context).highlightColor,
                    //       enabled: true,
                    //       child: Container(
                    //         height: 120,
                    //         width: MediaQuery.of(context).size.width,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //
                    //       ),
                    //     );
                    //   },
                    //   imageBuilder: (context, imageProvider) {
                    //     return Container(
                    //       height: 120,
                    //       width: MediaQuery.of(context).size.width,
                    //       decoration: BoxDecoration(
                    //         image: DecorationImage(
                    //           image: imageProvider,
                    //           fit: BoxFit.cover,
                    //
                    //         ),
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //     );
                    //   },
                    //   errorWidget: (context, url, error) {
                    //     return Shimmer.fromColors(
                    //       baseColor: Theme.of(context).hoverColor,
                    //       highlightColor: Theme.of(context).highlightColor,
                    //       enabled: true,
                    //       child: Container(
                    //         height: 120,
                    //         width: MediaQuery.of(context).size.width,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(8),
                    //         ),
                    //         child: Icon(Icons.error),
                    //       ),
                    //     );
                    //   },
                    // ),

                    SizedBox(height: 10.0,),

                    Row(
                      children: [
                        //conference
                        Expanded(child:
                        InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ConferenceScreen()));
                            },
                            child:Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                        //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
                        // fit: BoxFit.fill
                        //   )
                          ),

                          child:
                          Align(
                              alignment: Alignment.center,
                              child:Text("Conference")),

                        ))),
                        SizedBox(width: 15.0,),

                        //info beats
                        Expanded(child:
                        InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>InfobeatsScreen()));
                            },
                            child:Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
                            // fit: BoxFit.fill
                            //   )
                          ),
                          child:
                          Align(
                              alignment: Alignment.center,
                              child:Text("Infobeats")),

                        )))
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //conference
                        Expanded(child: Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
                            // fit: BoxFit.fill
                            //   )
                          ),
                          child:
                          Align(
                              alignment: Alignment.center,
                              child:Text("Breakout rooms",textAlign: TextAlign.center,)),

                        )),
                        SizedBox(width: 15.0,),
                        //info beats
                        Expanded(child:
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));
                          },
                            child:Container(
                          height: 160,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            //     image:  DecorationImage(image: AssetImage(Images.profile_pic),
                            // fit: BoxFit.fill
                            //   )
                          ),
                          child:
                          Align(
                              alignment: Alignment.center,
                              child:Text("Tickets")),

                        )))
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
