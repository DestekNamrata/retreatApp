import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Screens/mainNavigation.dart';
import 'package:flutter_app/Screens/sos_screen.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
import 'package:flutter_app/Widgets/app_dialogs.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Bloc/scanAndGetData/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GenerateQR extends StatefulWidget {
  String? title,attendanceType,roomNo;
  GenerateQR({Key? key,@required this.title,@required this.attendanceType,@required this.roomNo}):super(key: key);

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scanAndGetDataBloc = BlocProvider.of<ScanAndGetDataBloc>(context);
    // const fiveSeconds = const Duration(seconds: 5);
    // // _fetchData() is your function to fetch data
    //
    // timer=Timer.periodic(fiveSeconds, (Timer t) => setBlocData());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer!.cancel();
    super.dispose();

  }

  void setBlocData() async {
    isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
    if (isconnectedToInternet == true) {
      scanAndGetDataBloc!.add(
          OnGetAttendanceData(attendanceType: widget.attendanceType.toString(),
              room_no: widget.roomNo.toString()));
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
        // elevation: 0,
        title:
        InkWell(
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainNavigation(userType: "0")));
            },
            child:Icon(Icons.arrow_back,size:20.0,color: Colors.black,)),
        // automaticallyImplyLeading: false,
        actions: [
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
                              .dividerColor),
                      child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            textAlign: TextAlign.center,
                            "SOS",
                            style: TextStyle(
                                color: AppTheme.appColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          )))),
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
                            "1",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter-Regular'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )),
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
      body: BlocBuilder<ScanAndGetDataBloc,ScanAndGetDataState>(builder: (context,scan){
        return BlocListener<ScanAndGetDataBloc,ScanAndGetDataState>(listener: (context,state){

          if (state is GetAttendanceDataSuccess)
          {

          }

        },
          child:
          Container(
            padding: EdgeInsets.all(20),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title.toString(),style: TextStyle(fontSize: 25,fontFamily: 'Inter-Bold',fontWeight: FontWeight.w600),),
                SizedBox(height: 20.0,),
                Text("Scan QR Code",textAlign:TextAlign.center,style: TextStyle(fontSize: 20),),
                SizedBox(height: 20),
                QrImage(data: qrData,size:300.0),
                // SizedBox(height: 20),
                // Text("Generate QR Code",style: TextStyle(fontSize: 20),),
                //
                // //TextField for input link
                // TextField(
                //   decoration: InputDecoration(
                //       hintText: "Enter your link here..."
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   //Button for generating QR code
                //   child: FlatButton(
                //     onPressed: () async {
                //       //a little validation for the textfield
                //       if (qrdataFeed.text.isEmpty) {
                //         setState(() {
                //           qrData = "";
                //         });
                //       } else {
                //         setState(() {
                //           qrData = qrdataFeed.text;
                //         });
                //       }
                //     },
                //     //Title given on Button
                //     child: Text("Generate QR Code",style: TextStyle(color: Colors.indigo[900],),),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20),
                //       side: BorderSide(color: Colors.black),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        );
      }),

    );
  }
}
