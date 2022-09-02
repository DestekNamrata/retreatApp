import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Bloc/breather/bloc.dart';
import 'package:flutter_app/Bloc/unconference/bloc.dart';
import 'package:flutter_app/Bloc/unconference/unconference_bloc.dart';
import 'package:flutter_app/Bloc/unconference/unconference_state.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Models/model_live_polls.dart';
import 'package:flutter_app/Models/model_room_list.dart';
import 'package:flutter_app/Screens/GenerateQR/generateQrCode.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
import 'package:flutter_app/Utils/util_preferences.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:flutter_app/Widgets/app_dialogs.dart';
import '../sos_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter_app/Screens/mainNavigation.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_app/Screens/Breather/breather_detail.dart';

import '../../Utils/translate.dart';

class BreatherScreen extends StatefulWidget {
  String? eventType;

  BreatherScreen({Key? key, @required this.eventType});

  BreatherScreenState createState() => BreatherScreenState();
}

class BreatherScreenState extends State<BreatherScreen> {
  BreathersBloc? breathersBloc;
  final _controller = RefreshController(initialRefresh: false);
  List<RoomData> roomList = [];
  bool isconnectedToInternet = false;
  bool flagNoRoomAvailable = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    breathersBloc = BlocProvider.of<BreathersBloc>(context);
    setBlocData();
  }

  void setBlocData() async {
    isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
    if (isconnectedToInternet == true) {
      breathersBloc!.add(GetRoomList());
    } else {
      CustomDialogs.showDialogCustom(
          "Internet", "Please check your Internet Connection!", context);
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    roomList = [];
    setBlocData();
    _controller.refreshCompleted();
  }

  Widget getBreatherList(List<RoomData> roomList,int index){
    if (roomList.length <= 0) {
      GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 3,
          itemBuilder: (BuildContext ctx, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Shimmer.fromColors(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 10,
                            width: 180,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Container(
                            height: 10,
                            width: 150,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                baseColor: Theme.of(context).hoverColor,
                highlightColor: Theme.of(context).highlightColor,
              ),
            );
          });

    }
    return InkWell(
      onTap: (){
        UtilPreferences.getString("qrFlag")=="0" //checkedout out i.e exit room
            ?
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GenerateQR(title: "Breather",attendanceType: "4",
        roomNo: roomList[index].id!.toString(),flagQr: "0",)))
            :
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreatherDetail(eventType:"4",roomNo: "1",)));


      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            ListTile(
              title: Text("Booth 1", style: TextStyle(color: AppTheme.textHighlight,fontWeight: FontWeight.w500),),

              subtitle: Text(roomList[index].roomName!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                  color: Colors.black,fontFamily: 'Inter-Bold'),),
            )
          ],
        ),
      ),
    );
  }



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
        body: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Text(Translate.of(context)!.translate("breakout"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,
                fontFamily: 'SquadaOne'),),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: ElevatedButton(
            //       onPressed: (){
            //
            //       },
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
          body:SafeArea(child:
          BlocBuilder<BreathersBloc, BreatherState>(
            builder: (context, breather) {
              return BlocListener<BreathersBloc, BreatherState>(
                listener: (context, state) {
                  if (state is RoomListSuccess) {
                    flagNoRoomAvailable = false;
                    roomList = state.roomList!;

                  }

                  if (state is RoomListFail) {
                    flagNoRoomAvailable = true;
                  }


                },
                child:
                SmartRefresher(
                    enablePullDown: true,
                    onRefresh: _onRefresh,
                    controller: _controller,
                    child:
                    Container(
                        child:
                            flagNoRoomAvailable==false?
                        Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemCount: roomList.length>0?roomList.length:3,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return getBreatherList(roomList,index);

                                  }),
                            ):
                                Center(child:Text("No Rooms Available",style:TextStyle(
                                  fontFamily: 'Inter-Bold',fontSize: 20.0,fontWeight: FontWeight.w600
                                )))
                    )
                ),
              );
            },
          )

          ),
        )

    );


  }

}
