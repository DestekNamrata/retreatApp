import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/Agenda/agenda_screen.dart';
import 'package:flutter_app/Screens/Agenda/agenda_screen_old.dart';
import 'package:flutter_app/Screens/Conference/conference_screen.dart';
import 'package:flutter_app/Screens/GenerateQR/generateQrCode.dart';
import 'package:flutter_app/Screens/GenerateQR/scanQrCode.dart';
import 'package:flutter_app/Screens/Home/home_screen.dart';
import 'package:flutter_app/Screens/Infobeats/infobeats_screen.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'Breather/breather_screen.dart';
import 'sos_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainNavigation extends StatefulWidget {
  String? userType;
  MainNavigation({Key? key,@required this.userType}):super(key: key);

  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  String title = "Home";

  ///List bottom menu
  List<BottomNavigationBarItem> _bottomBarItem(BuildContext context) {
    return [

      BottomNavigationBarItem(
        icon: Image.asset(
          Images.home,
          width: 20.0,
          height: 20.0,
        ),
        activeIcon: Image.asset(
          Images.home1,
          width: 20.0,
          height: 20.0,
        ),
        label: Translate.of(context)!.translate('home'),


      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          Images.agenda,
          width: 20.0,
          height: 20.0,
        ),
        activeIcon: Image.asset(
          Images.agenda1,
          width: 20.0,
          height: 20.0,
        ),
        label: Translate.of(context)!.translate('agenda'),

      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          Images.unconference,
          width: 20.0,
          height: 20.0,
        ),
        activeIcon: Image.asset(
          Images.unconference1,
          width: 20.0,
          height: 20.0,
        ),
        label: Translate.of(context)!.translate('conference'),

      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          Images.inforte1,
          width: 20.0,
          height: 20.0,
          color: Theme.of(context).unselectedWidgetColor,
        ),
        activeIcon: Image.asset(
          Images.inforte1,
          width: 20.0,
          height: 20.0,
        ),
        label: Translate.of(context)!.translate('infobeats'),

      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          Images.breather,
          width: 20.0,
          height: 20.0,
        ),
        activeIcon: Image.asset(
          Images.breather1,
          width: 20.0,
          height: 20.0,
        ),
        label: Translate.of(context)!.translate('breakout'),

      ),


    ];

  }


  ///On change tab bottom menu
  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);

      if (_selectedIndex == 0) {
        title = "Home";
      } else if (_selectedIndex == 1) {
        title = "Agenda";
      } else if (_selectedIndex == 2) {
        title = "Conference";
      }else if (_selectedIndex == 3) {
        title = "Infobeats";
      }else if (_selectedIndex == 4) {
        title = "Breakout";
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("userType="+Application.user.userType);

    // //for fcm flag navigation
    // if(PushNotify.notification!=null){
    //   if(userType=="1" && PushNotify.notification.flag=="fleet_order"){
    //     _selectedIndex=0;
    //   }else if(widget.fcmFlagNavigate=="logout"){  //for logout if userTpe is different
    //     _selectedIndex=3;
    //   }
    //   else if(userType=="0" && PushNotify.notification.flag=="cust_order"){
    //     _selectedIndex=2;//redirect to customer my orders part
    //   }
    // }

    // }

    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        // appBar:
        //
        // AppBar(
        //   title: Text(
        //     title,
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
        //     Row(
        //       children: [
        //         InkWell(
        //           onTap: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSScreen()));
        //           },
        //             child:Container(
        //           width: 55.0,
        //             decoration: BoxDecoration(
        //               border: Border.all(color: Colors.black),
        //               borderRadius: BorderRadius.circular(35.0),
        //
        //             ),
        //           child:Padding(
        //             padding: EdgeInsets.all(3.0),
        //               child:Text(textAlign: TextAlign.center,"SOS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.0),))
        //         )),
        //
        //         InkWell(
        //             onTap: () {
        //               },
        //             child: Stack(children: [
        //               // IconButton(
        //               //   icon:
        //               Image.asset(
        //                 Images.notiIcon,
        //                 width: 37.0,
        //                 height: 37.0,
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
        //             Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.only(right: 5.0),
        //               child: Icon(Icons.account_circle_rounded,color: Colors.grey,size: 30.0,),
        //             )
        //
        //             ),
        //
        //       ],
        //     )
        //   ],
        // ),
        //
        extendBody: true,
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeScreen(),
            AgendaScreen(),
            UtilPreferences.getString("qrFlag")=="0" //checkedout out i.e exit room
             ?
            GenerateQR(title: "UnConferrence", attendanceType: "2", roomNo: "",flagQr: "0",)
            :
            ConferenceScreen(eventType: "3",),//unconference 1==checked in flag
            UtilPreferences.getString("qrFlag")=="0" //checkedout out i.e exit room
                ?
            GenerateQR(title: "Inforte", attendanceType: "3", roomNo: "",flagQr: "0",)
            :
            //inforte
            InfobeatsScreen(eventType: "2"),

            BreatherScreen()
            // ConferenceScreen(),
            // // GenerateQR(),
            // // ScanQR(),
            // BreatherScreen()


          ],
        ),
        bottomNavigationBar:

        BottomNavigationBar(
          items: _bottomBarItem(context),
          selectedLabelStyle: TextStyle(fontSize: 12.0,fontFamily: 'Inter-Regular',fontWeight: FontWeight.w500),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Theme
              .of(context)
              .unselectedWidgetColor,
          selectedItemColor: Theme
              .of(context)
              .primaryColor,
          showUnselectedLabels: true,
          onTap: (index) {
            _onItemTapped(index);
          },


        )
    );
  }
}
