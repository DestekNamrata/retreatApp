import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_event.dart';
import 'package:flutter_app/Bloc/attendanceHistory/attendenceHistory_state.dart';
import 'package:flutter_app/Models/model_paymentHistory.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:intl/intl.dart';

import '../../../Bloc/attendanceHistory/attendanceHistory_bloc.dart';
import '../../../Configs/theme.dart';
import '../../../Utils/application.dart';
import '../../sos_screen.dart';
import '../profile_screen.dart';

class AttendanceHistory extends StatefulWidget{
  _AttendanceState createState()=> _AttendanceState();
}

class _AttendanceState extends State<AttendanceHistory>{

  AttendenceHistoryBloc? _attendenceHistoryBloc;
  List<AttendanceHistoryModel> attendenceHistoryList=[];

  void initState() {
    // TODO: implement initState
    super.initState();

    _attendenceHistoryBloc = BlocProvider.of<AttendenceHistoryBloc>(context);
    // _attendenceHistoryBloc!.add(OnLoadingAttendanceHistoryList(userid: Application.user!.id.toString()));
    _attendenceHistoryBloc!.add(OnLoadingAttendanceHistoryList(userid: "2"));

  }

  Widget data(){
    return ListView.builder(
      padding: EdgeInsets.all(5.0),
      itemBuilder: (context, index) {
        return Container(
          // margin: EdgeInsets.only(left:5,right: 5,bottom:8.0),

          child: Card(
            elevation: 5.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child:
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("InForte",
                          style: TextStyle(fontSize: 18.0,
                              fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 10.0,),
                    ],
                  ),

                ),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: AppTheme.appColor,

                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
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
                            Text("Punch In", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14.0,color: Colors.white),),
                            Text("12:30 pm", textAlign: TextAlign.center,
                              style:
                              TextStyle(fontWeight: FontWeight.w600,
                                  fontSize: 14.0,color: Colors.white),),
                          ],
                        ),
                      ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 13,
                        endIndent: 13,
                      ),
                      Expanded(child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text("Punch Out", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14.0,color: Colors.white),),
                            Text(
                              "2:30 pm", textAlign: TextAlign.center, style:
                            TextStyle(fontWeight: FontWeight.w600,
                                fontSize: 14.0,color: Colors.white),),
                          ],
                        ),
                      ),),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 13,
                        endIndent: 13,
                      ),
                      //duration
                      Expanded(child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              "Duration(hrs)", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400,
                                  fontSize: 14.0,color: Colors.white),),
                            Text("2:00", textAlign: TextAlign.center, style:
                            TextStyle(fontWeight: FontWeight.w600,
                                fontSize: 14.0,color: Colors.white),),
                          ],
                        ),
                      ),)
                    ],
                  ),
                )
              ],
            ),

          ),
        );
      },
      itemCount: 6,
    );
  }



  Widget getAttendanceList(BuildContext context, List<AttendanceHistoryModel> attendenceHistoryList){
    if(attendenceHistoryList.length <= 0) {
      return
        ListView.builder(
          scrollDirection: Axis.vertical,
          // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Theme.of(context).hoverColor,
              highlightColor: Theme.of(context).highlightColor,
              enabled: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    //visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    // leading: nameIcon(),
                    leading: CachedNetworkImage(
                      filterQuality: FilterQuality.medium,
                      // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                      imageUrl: "https://picsum.photos/250?image=9",
                      // imageUrl: model.cart[index].productImg == null
                      //     ? "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                      //     : model.cart[index].productImg,
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).highlightColor,
                          enabled: true,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).highlightColor,
                          enabled: true,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                    title: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Loading...",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              //color: Theme.of(context).accentColor
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Text(
                                  ".......",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                ),
              ),
            );
          },
          itemCount: List.generate(8, (index) => index).length,
        );
    }
    return ListView.builder(
      padding: EdgeInsets.all(5.0),
      itemBuilder: (context, index) {
        return Container(
          // margin: EdgeInsets.only(left:5,right: 5,bottom:8.0),

          child: Card(
            elevation: 5.0,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child:
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: (() {
                          if(attendenceHistoryList[index].attendanceType.toString() == "1"){
                            return Text("Hotel",
                                  style: TextStyle(fontSize: 18.0,
                                      fontWeight: FontWeight.w600),);
                          }
                          else if(attendenceHistoryList[index].attendanceType.toString() == "2"){
                            return Text("InForte",
                              style: TextStyle(fontSize: 18.0,
                                  fontWeight: FontWeight.w600),);
                          }
                          else if(attendenceHistoryList[index].attendanceType.toString() == "3"){
                            return Text("UnConference",
                              style: TextStyle(fontSize: 18.0,
                                  fontWeight: FontWeight.w600),);
                          }
                          else if(attendenceHistoryList[index].attendanceType.toString() == "4"){
                            return Text("Breather",
                              style: TextStyle(fontSize: 18.0,
                                  fontWeight: FontWeight.w600),);
                          }
                        }())
                        // Text(attendenceHistoryList[index].roomNo.toString(),
                        //   style: TextStyle(fontSize: 18.0,
                        //       fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height: 10.0,),
                    ],
                  ),

                ),
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: AppTheme.appColor,

                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
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
                            Text("Punch In", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 12.0,color: Colors.white),),
                            SizedBox(
                              height: 3,
                            ),
                            Text(attendenceHistoryList[index].checkinTime.toString(), textAlign: TextAlign.center,
                              style:
                              TextStyle(fontWeight: FontWeight.w700,
                                  fontSize: 15.0,color: Colors.white),),
                          ],
                        ),
                      ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 13,
                        endIndent: 13,
                      ),
                      Expanded(child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text("Punch Out", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 12.0,color: Colors.white),),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              attendenceHistoryList[index].checkoutTime.toString(), textAlign: TextAlign.center, style:
                            TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 15.0,color: Colors.white),),
                          ],
                        ),
                      ),),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        indent: 13,
                        endIndent: 13,
                      ),
                      //duration
                      Expanded(child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Text(
                              "Duration", textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 12.0,color: Colors.white),),
                            SizedBox(
                              height: 3,
                            ),
                            Text(attendenceHistoryList[index].duration.toString()+"hrs", textAlign: TextAlign.center, style:
                            TextStyle(fontWeight: FontWeight.w700,
                                fontSize: 15.0,color: Colors.white),),
                          ],
                        ),
                      ),)
                    ],
                  ),
                )
              ],
            ),

          ),
        );
      },
      itemCount: attendenceHistoryList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: 10.0,
        backgroundColor: AppTheme.backgroundColor,
        elevation: 5,
        leading: InkWell(
            onTap: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ProfileScreen()));

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
                          //     .dividerColor,
                          // color: Colors.white
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
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Image.asset(
                        Images.account,
                        width: 25.0,
                        height: 25.0,

                      ),
                    ),
                  )),
              SizedBox(width: 15,)

            ],
          )
        ],


      ),
      backgroundColor: AppTheme.backgroundColor,
      body: BlocBuilder<AttendenceHistoryBloc, AttendanceHistoryState>(builder: (context, state) {
        if (state is AttendanceHistorySuccess) {
          attendenceHistoryList = state.attendenceHistoryList!;
          // pageCount = (productList.length / rowsPerPage).ceilToDouble();
          // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
        }

        return
          SafeArea(
            child:SingleChildScrollView(
              child: Container(
                child: Column(

                  children: [


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Attendance History",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800
                          ),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(13.0)
                        // ),
                        child:
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("Agenda", style: TextStyle(
                              //   fontSize: 18,
                              //   fontWeight: FontWeight.bold,
                              //     fontFamily: 'Inter-Regular'
                              // ),),
                              Container(
                                height: MediaQuery.of(context).size.height,
                                  child: getAttendanceList(context, attendenceHistoryList),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )


          );
      }
      )

    );
  }

}