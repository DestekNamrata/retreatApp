import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import '../sos_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/translate.dart';
import 'breather_detail.dart';
import 'breather_screen.dart';

class BreatherScanner extends StatefulWidget{
  BreatherScannerState createState()=> BreatherScannerState();
}

class BreatherScannerState extends State<BreatherScanner>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:
        AppBar(
          // automaticallyImplyLeading: false,
          // toolbarHeight: 10.0,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: (){

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BreatherScreen()));
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
        body: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text(Translate.of(context)!.translate("breakout"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,
                fontFamily: 'Inter-Regular'),),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: ElevatedButton(
            //       onPressed: (){},
            //       child: Text("Exit Room",
            //         style: TextStyle(
            //             color: AppTheme.appColor,
            //             fontWeight: FontWeight.w600),),
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12), // <-- Radius
            //         ),
            //         side: BorderSide(
            //
            //           width: 2.0,
            //           color: AppTheme.appColor,
            //         ),
            //       ),
            //
            //     ),
            //   ),
            //
            //   SizedBox(
            //     width: 20,
            //   )
            // ],

          ),
          body: SafeArea(
              child: Container(
                child:
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(

                    children: [
                      SizedBox(height: 10,),

                      //Venue
                      Row(
                        children: [

                          Text("Venue:",style: TextStyle(
                            fontSize: 20,
                              fontWeight: FontWeight.w700,
                            color: AppTheme.textHighlight
                          ),),
                          SizedBox(width: 5,),
                          Text("Deewan-E-Khas",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.textHighlight
                          ),),

                        ],
                      ),


                      SizedBox(
                        height: 10,
                      ),

                      //SPOC
                      Row(
                        children: [

                          Text("SPOC:",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textHighlight
                          ),),
                          SizedBox(width: 5,),
                          Text("Tushar Matetwar",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.textHighlight
                          ),),


                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Contact
                      Row(
                        children: [

                          Text("Contact:",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textHighlight
                          ),),
                          SizedBox(width: 5,),
                          Text("9876543210",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.textHighlight
                          ),),


                        ],
                      ),

                      SizedBox(
                        height: 350,
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BreatherDetail()));
                        },
                        child: Text("Scan to enter",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textHighlight
                        ),),
                      )
                    ],
                  ),
                ),
              )
          ),
        )

    );
  }

}