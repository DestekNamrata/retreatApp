import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Screens/Agenda/dayWiseScreen.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/mainNavigation.dart';
import 'package:flutter_app/Screens/sos_screen.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:flutter_app/Configs/theme.dart';

class AgendaScreen extends StatefulWidget{
  _AgendaState createState()=>_AgendaState();
}

class _AgendaState extends State<AgendaScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 10.0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:InkWell(
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainNavigation(userType: "0")));
            },
            child:Icon(Icons.arrow_back,size:20.0,color: Colors.black,)),

        // title:
        //  InkWell(
        //    onTap: (){
        //      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainNavigation(userType: "0")));
        //    },
        //      child:Icon(Icons.arrow_back,size:20.0,color: Colors.black,)),
        // automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSScreen()));
                  },
                  child:Container(
                      width: 40.0,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                          borderRadius:
                          BorderRadius.circular(5.0),
                          color: Theme.of(context)
                              .dividerColor
                      ),
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
                width: 20.0,
              ),
              InkWell(
                  onTap: () {
                  },
                  child: Stack(
                    children: [
                      // IconButton(
                      //   icon:
                      Image.asset(
                        Images.notifi,
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
                width: 20.0,
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
              SizedBox(width: 15,)

            ],
          )
        ],

      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15.0,),
            Text(Translate.of(context)!.translate("agenda"),style: TextStyle(fontSize:25.0,fontFamily:'Inter-SemiBold',
                color: Colors.black,fontWeight: FontWeight.w600),),
            SizedBox(width: 15.0,),

            //23Sept
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DayWiseScreen(title: "Day 1",attendanceDay:"1")));
              },
              child:Image.asset(Images.day1),
            ),
             //24Sept
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DayWiseScreen(title: "Day 2",attendanceDay:"2")));

              },
              child:Image.asset(Images.day2),
            ),
            //25Sept
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DayWiseScreen(title: "Day 3",attendanceDay:"3")));

              },
              child:Image.asset(Images.day3),
            ),

          ],
        )),
      ),
    );
  }

}