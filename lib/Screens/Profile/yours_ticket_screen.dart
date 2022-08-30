import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Widgets/app_button.dart';

import '../../Configs/image.dart';
import '../../Configs/theme.dart';
import '../sos_screen.dart';

class YoursTicketScreen extends StatefulWidget{
  _YoursTicketScreenState createState()=>_YoursTicketScreenState();
}

class _YoursTicketScreenState extends State<YoursTicketScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: 10.0,
        backgroundColor: AppTheme.backgroundColor,
        elevation: 5,
        leading: InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen()));
            },
            child: Icon(Icons.arrow_back_rounded,color: Colors.black,)),
        // title: Text(Translate.of(context)!.translate("conference"),style: TextStyle(color: Colors.black),),
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
                          // color: Theme.of(context)
                          //     .dividerColor
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Your Tickets",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),)),
              ),

              Container(
                width: 265,
                height: 265,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        Images.Ticket22Sept,
                        width: 260.0,
                        height: 260.0,
                      ),
                    ),
                  ],
                ),
              ),

              // For Ticket 25
              Container(
                width: 265,
                height: 265,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        Images.Ticket25Sept,
                        width: 260.0,
                        height: 260.0,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          )

      ),
    );
  }

}