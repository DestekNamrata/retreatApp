import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/Breather/breather_detail.dart';
import 'package:flutter_app/Screens/Breather/breather_screen.dart';
import 'package:flutter_app/Screens/Conference/conference_screen.dart';
import 'package:flutter_app/Screens/Infobeats/infobeats_screen.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/mainNavigation.dart';
import 'package:flutter_app/Screens/sos_screen.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'package:flutter_app/Widgets/app_dialogs.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Bloc/scanAndGetData/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GenerateQR extends StatefulWidget {
  String? title,attendanceType,roomNo,flagQr;
  GenerateQR({Key? key,@required this.title,@required this.attendanceType,@required this.roomNo,@required this.flagQr}):super(key: key);

  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {

  // String qrData="https://github.com/ChinmayMunje";
  String qrData=Application.user!.id.toString();
  final qrdataFeed = TextEditingController();
  ScanAndGetDataBloc? scanAndGetDataBloc;
  bool isconnectedToInternet = false;
  Timer? timer;
  Duration? fiveSeconds;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scanAndGetDataBloc = BlocProvider.of<ScanAndGetDataBloc>(context);
     fiveSeconds = const Duration(seconds: 10);
    // _fetchData() is your function to fetch data
  // setBlocData(fiveSeconds);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // timer!.cancel();
    super.dispose();

  }

  void setBlocData(Duration fiveSeconds) async {
    isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
    if (isconnectedToInternet == true) {

      // timer=Timer.periodic(fiveSeconds, (Timer t) {
        scanAndGetDataBloc!.add(
            OnGetAttendanceData(attendanceType: widget.attendanceType.toString(),
                room_no: widget.roomNo.toString()));
      // });


    } else {
      CustomDialogs.showDialogCustom(
          "Internet", "Please check your Internet Connection!", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        // toolbarHeight: 10.0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:InkWell(
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainNavigation(userType: "0")));
            },
            child:Icon(Icons.arrow_back,size:20.0,color: Colors.black,)),
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
      body: BlocBuilder<ScanAndGetDataBloc,ScanAndGetDataState>(builder: (context,scan){
        return BlocListener<ScanAndGetDataBloc,ScanAndGetDataState>(listener: (context,state){

          if (state is GetAttendanceDataSuccess)
          {
            if(state.data!.checkOut==0){ //0=checked in and 1=checkout
              UtilPreferences.setString("qrFlag", widget.flagQr!); //1=exit room so checked out
          if(widget.attendanceType=="2"){ //inforte
            Navigator.push(context, MaterialPageRoute(builder: (context)=>InfobeatsScreen(eventType:"2")));

          }else if(widget.attendanceType=="3"){//unconference
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ConferenceScreen(eventType:"3")));

          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BreatherDetail(eventType:"4",roomNo: widget.roomNo!,)));

          }
          }else{
              UtilPreferences.setString("qrFlag", widget.flagQr!); //0=checked out flag

              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavigation(userType: Application.user!.role.toString())));


            }

          }

        },
          child:
          Container(
            padding: EdgeInsets.all(20),
            child:
           SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title.toString(),style: TextStyle(fontSize: 25,fontFamily: 'Inter-Bold',fontWeight: FontWeight.w600),),
                SizedBox(height: 20.0,),
                if(widget.flagQr!="1")
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //venue
                    Row(
                      children: [
                        Text("Venue: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                        Text("Deewan-E-Khas",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                      ],
                    ),
                    //spoc
                    Row(
                      children: [
                        Text("SPOC: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                        Text("Tushar Matewar",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                      ],
                    ),
                    //contact
                    Row(
                      children: [
                        Text("Contact: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                        Text("9876543210",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 70),
                Align(
                  alignment: Alignment.center,
                    child:QrImage(data: qrData,size:300.0)),
                SizedBox(height: 10),

          Align(
            alignment: Alignment.center,
            child:
                InkWell(
                  onTap:(){
                    setBlocData(fiveSeconds!);
                 },
                    child:
            Text(widget.flagQr!="1"?"Scan to enter":"Scan to Exit",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                  fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),))),
              ],
            ),
          )
        ));
      }),

    );
  }
}
