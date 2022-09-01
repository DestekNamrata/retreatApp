import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Bloc/unconference/bloc.dart';
import 'package:flutter_app/Bloc/unconference/unconference_bloc.dart';
import 'package:flutter_app/Bloc/unconference/unconference_state.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
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

import '../../Utils/translate.dart';

class DetailsTab extends StatefulWidget {
  String? eventType;

  DetailsTab({Key? key, @required this.eventType});

  DetailsTabState createState() => DetailsTabState();
}

class DetailsTabState extends State<DetailsTab> {
  UnconferenceBloc? unconferenceBloc;
  final _controller = RefreshController(initialRefresh: false);
  List<UnConfAgendaData> unconfAgendaList = [];
  bool isconnectedToInternet = false;
  bool flagNoAgendaAvailable = false;
  String punchIn = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unconferenceBloc = BlocProvider.of<UnconferenceBloc>(context);
    setBlocData();
  }

  void setBlocData() async {
    isconnectedToInternet = await ConnectivityCheck.checkInternetConnectivity();
    if (isconnectedToInternet == true) {
      unconferenceBloc!.add(GetAgendaList(
          eventType: widget.eventType!,
          userId: Application.user!.id.toString(),
      roomNo: ""));
    } else {
      CustomDialogs.showDialogCustom(
          "Internet", "Please check your Internet Connection!", context);
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    unconfAgendaList = [];
    setBlocData();
    _controller.refreshCompleted();
  }

  Widget getAgendaList(List<UnConfAgendaData> unconfAgendaList, int index) {
    if (unconfAgendaList.length <= 0) {
      return ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
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
        },
        itemCount: 6,
      );
    }
    return Container(
      // margin: EdgeInsets.only(left:5,right: 5,bottom:8.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // //description
          // Text(
          //  "aSSADD",
          //   style: TextStyle(
          //       fontSize: 14.0,
          //       fontFamily: 'Sofia Pro',
          //       fontWeight: FontWeight.w400,
          //       color: Theme.of(context).unselectedWidgetColor),
          // )
          Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("Room No.1"),
                  //     Text("August 31"),
                  //   ],
                  // ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                              unconfAgendaList[index].eventDate! +
                                  "," +
                                  unconfAgendaList[index].startTime!,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textHighlight),
                            )),
                        Expanded(
                            child: Text(
                              unconfAgendaList[index].activity!,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Inter-Bold',
                                  fontWeight: FontWeight.w600),
                            )),
                      ]),
                  SizedBox(height: 8),
                  // ReadMoreText(
                  //   widget.orderList[widget.position].productDesc,
                  //   style: Theme.of(context).textTheme.button.copyWith(
                  //       fontSize: 12.0,
                  //       color: AppTheme.textColor,
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: "Poppins"),
                  //   trimLines: 2,
                  //   trimMode: TrimMode.Line,
                  //   trimCollapsedText: 'Show more',
                  //   trimExpandedText: 'Show less',
                  // ),
                  Html(data: unconfAgendaList[index].description!.toString()),
                  // RaisedButton(
                  //   child: Text('Button0'),
                  //   onPressed: () => print('Pressed button0'),
                  // ),
                  // ExpandChild(
                  //   child: Column(
                  //     children: <Widget>[
                  //       Text(
                  //           "Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. ")
                  //       // RaisedButton(
                  //       //   child: Text('Button1'),
                  //       //   onPressed: () => print('Pressed button1'),
                  //       // ),
                  //       // RaisedButton(
                  //       //   child: Text('Button2'),
                  //       //   onPressed: () => print('Pressed button2'),
                  //       // ),
                  //       // RaisedButton(
                  //       //   child: Text('Button3'),
                  //       //   onPressed: () => print('Pressed button3'),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: 10.0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainNavigation(userType: "0")));
            },
            child: Icon(
              Icons.arrow_back,
              size: 20.0,
              color: Colors.black,
            )),
        // title: Text(Translate.of(context)!.translate("conference"),style: TextStyle(color: Colors.black),),
        // automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SOSScreen()));
                  },
                  child: Container(
                      width: 40.0,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Theme.of(context).dividerColor),
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
                width: 20.0,
              ),
              InkWell(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        Images.notifi,
                        width: 22.0,
                        height: 22.0,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: new Container(
                          padding: EdgeInsets.all(1),
                          decoration: new BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.5),
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
                  )),

              SizedBox(
                width: 20.0,
              ),

              //profile
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      Images.account,
                      width: 25.0,
                      height: 25.0,
                    ),
                  )),
              SizedBox(
                width: 15,
              )
            ],
          )
        ],
      ),
      body: SafeArea(child: BlocBuilder<UnconferenceBloc, UnconferenceState>(
        builder: (context, unconference) {
          return BlocListener<UnconferenceBloc, UnconferenceState>(
            listener: (context, state) {
              if (state is AgendaListSuccess) {
                flagNoAgendaAvailable = false;
                unconfAgendaList = state.agendaList!;
                punchIn = state.punchIn!;
              }

              if (state is AgendaListFail) {
                flagNoAgendaAvailable = true;
              }

              if (state is AgendaListLoading) {
                flagNoAgendaAvailable = false;
              }
            },
            child: SmartRefresher(
                enablePullDown: true,
                onRefresh: _onRefresh,
                controller: _controller,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      //punch and duration
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.appColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Row(
                            children: [
                              //punch in
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: AppTheme.appColor,
                                        borderRadius: BorderRadius.circular(8.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("Punch in",
                                              style:
                                              TextStyle(color: Colors.white)),
                                          Text(punchIn!.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18))
                                        ],
                                      ),
                                    ),
                                  )),
                              // SizedBox(width: 5.0,),

                              SizedBox(
                                height: 50,
                                child: VerticalDivider(
                                  thickness: 2,
                                  indent: 13,
                                  endIndent: 13,
                                  color: Colors.white,
                                ),
                              ),
                              //duration
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: AppTheme.appColor,
                                        borderRadius: BorderRadius.circular(8.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Duration",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Text("01:56 hrs",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18))
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),

                      //agenda listing
                      flagNoAgendaAvailable == false
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Agenda",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                    height: 200.0,
                                    child:
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        padding: EdgeInsets.all(5.0),
                                        itemCount:
                                        unconfAgendaList.length > 0
                                            ? unconfAgendaList.length
                                            : 3,
                                        itemBuilder: (context, index) {
                                          return getAgendaList(
                                              unconfAgendaList, index);
                                        })
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                          : Text(
                        "No Agenda Available",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter-Bold',
                            fontSize: 20.0,
                            color: AppTheme.textColor),
                      ),
                      //live poll
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(10.0)),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text("Live Poll",
                      //               style: TextStyle(
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.w600)),
                      //           Card(
                      //             elevation: 6.0,
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Column(
                      //                 children: [
                      //                   //name,image,time
                      //                   Row(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     children: [
                      //                       Row(
                      //                         children: [
                      //                           CachedNetworkImage(
                      //                             filterQuality:
                      //                                 FilterQuality.medium,
                      //                             // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                      //                             // imageUrl:
                      //                             //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      //                             imageUrl:
                      //                                 "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      //                             placeholder: (context, url) {
                      //                               return Shimmer.fromColors(
                      //                                 baseColor:
                      //                                     Theme.of(context)
                      //                                         .hoverColor,
                      //                                 highlightColor:
                      //                                     Theme.of(context)
                      //                                         .highlightColor,
                      //                                 enabled: true,
                      //                                 child: Container(
                      //                                   height: 80,
                      //                                   width: 80,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: Colors.white,
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(40),
                      //                                   ),
                      //                                 ),
                      //                               );
                      //                             },
                      //                             imageBuilder:
                      //                                 (context, imageProvider) {
                      //                               return Container(
                      //                                 height: 80,
                      //                                 width: 80,
                      //                                 decoration: BoxDecoration(
                      //                                   image: DecorationImage(
                      //                                     image: imageProvider,
                      //                                     fit: BoxFit.cover,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(40),
                      //                                 ),
                      //                               );
                      //                             },
                      //                             errorWidget:
                      //                                 (context, url, error) {
                      //                               return Shimmer.fromColors(
                      //                                 baseColor:
                      //                                     Theme.of(context)
                      //                                         .hoverColor,
                      //                                 highlightColor:
                      //                                     Theme.of(context)
                      //                                         .highlightColor,
                      //                                 enabled: true,
                      //                                 child: Container(
                      //                                   height: 80,
                      //                                   width: 80,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: Colors.white,
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(40),
                      //                                   ),
                      //                                   child:
                      //                                       Icon(Icons.error),
                      //                                 ),
                      //                               );
                      //                             },
                      //                           ),
                      //                           SizedBox(
                      //                             width: 10.0,
                      //                           ),
                      //                           Text("Name Surname")
                      //                         ],
                      //                       ),
                      //                       Text("1 hr ago")
                      //                     ],
                      //                   ),
                      //                   SizedBox(
                      //                     height: 8.0,
                      //                   ),
                      //
                      //                   //desc
                      //                   Text(
                      //                       "Lorem ipsum color sit amet,consectur adipsing fdsgdgsdsgd sgdgsgdsfgdfsgf"),
                      //                   SizedBox(
                      //                     height: 10.0,
                      //                   ),
                      //                   //image
                      //                   CachedNetworkImage(
                      //                     filterQuality: FilterQuality.medium,
                      //                     // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                      //                     // imageUrl:
                      //                     //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      //                     imageUrl:
                      //                         "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      //                     placeholder: (context, url) {
                      //                       return Shimmer.fromColors(
                      //                         baseColor:
                      //                             Theme.of(context).hoverColor,
                      //                         highlightColor: Theme.of(context)
                      //                             .highlightColor,
                      //                         enabled: true,
                      //                         child: Container(
                      //                           height: 180,
                      //                           width: MediaQuery.of(context)
                      //                               .size
                      //                               .width,
                      //                           decoration: BoxDecoration(
                      //                             color: Colors.white,
                      //                             borderRadius:
                      //                                 BorderRadius.circular(5),
                      //                           ),
                      //                         ),
                      //                       );
                      //                     },
                      //                     imageBuilder:
                      //                         (context, imageProvider) {
                      //                       return Container(
                      //                         height: 180,
                      //                         width: MediaQuery.of(context)
                      //                             .size
                      //                             .width,
                      //                         decoration: BoxDecoration(
                      //                           image: DecorationImage(
                      //                             image: imageProvider,
                      //                             fit: BoxFit.cover,
                      //                           ),
                      //                           borderRadius:
                      //                               BorderRadius.circular(5),
                      //                         ),
                      //                       );
                      //                     },
                      //                     errorWidget: (context, url, error) {
                      //                       return Shimmer.fromColors(
                      //                         baseColor:
                      //                             Theme.of(context).hoverColor,
                      //                         highlightColor: Theme.of(context)
                      //                             .highlightColor,
                      //                         enabled: true,
                      //                         child: Container(
                      //                           height: 180,
                      //                           width: MediaQuery.of(context)
                      //                               .size
                      //                               .width,
                      //                           decoration: BoxDecoration(
                      //                             color: Colors.white,
                      //                             borderRadius:
                      //                                 BorderRadius.circular(5),
                      //                           ),
                      //                           child: Icon(Icons.error),
                      //                         ),
                      //                       );
                      //                     },
                      //                   ),
                      //                   SizedBox(
                      //                     height: 10.0,
                      //                   ),
                      //
                      //                   //submit button
                      //                   AppButton(
                      //                     text: "Submit",
                      //                     onPressed: () {},
                      //                     shape: RoundedRectangleBorder(
                      //                       borderRadius: BorderRadius.all(
                      //                           Radius.circular(50)),
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )),
          );
        },
      )),
    );
  }

}
