import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/unconference/unconference_bloc.dart';
import 'package:flutter_app/Bloc/unconference/unconference_event.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Models/model_agenda_unconference.dart';
import 'package:flutter_app/Screens/GenerateQR/generateQrCode.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/connectivity_check.dart';
import 'package:flutter_app/Widgets/app_dialogs.dart';
import '../sos_screen.dart';
import '../../Utils/translate.dart';
import 'breather_screen.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BreatherDetail extends StatefulWidget{
  String? eventType,roomNo;
  BreatherDetail({Key? key, @required this.eventType,@required this.roomNo});

  BreatherDetailState createState()=> BreatherDetailState();
}

class BreatherDetailState extends State<BreatherDetail>{
  UnconferenceBloc? unconferenceBloc;
  final _controller = RefreshController(initialRefresh: false);
  List<UnConfAgendaData> unconfAgendaList = [];
  bool isconnectedToInternet = false;
  bool flagNoAgendaAvailable = false;

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
          roomNo: widget.roomNo!));
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
  final testData = ["Example1", "Example2", "Example3", "Example100"];


  @override
  Widget build(BuildContext context) {

    final _markDownData = testData.map((x) => "- $x\n").reduce((x, y) => "$x$y");


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
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                        GenerateQR(title: "Breather"
                          , attendanceType: "4", roomNo: widget.roomNo!,flagQr: "1",)));
                  },
                  child: Text("Exit Room",
                    style: TextStyle(
                        color: AppTheme.appColor,
                        fontWeight: FontWeight.w600),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                    side: BorderSide(

                      width: 2.0,
                      color: AppTheme.appColor,
                    ),
                  ),

                ),
              ),

              SizedBox(
                width: 20,
              )
            ],

          ),
          body: SafeArea(
              child: Container(
                child:
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Biz Market 1", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.textHighlight
                                ),),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Rise",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700
                                ),),

                                SizedBox(height: 5,),

                                Row(
                                  children: [

                                    Text("SPOC: ", style: TextStyle(
                                        fontSize: 11,
                                      fontWeight: FontWeight.w600
                                    ),),
                                    Text("Tushar Mathewar", style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("|"),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text("Contact: ", style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    Text("9876543210", style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),
                                SizedBox(height: 5,),

                                Row(
                                  children: [
                                    Text("Venue: ", style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600
                                    ),),
                                    Text("Dewan-E-Khass", style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  ],
                                ),


                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  width: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children:  [
                                            Text("•",style: TextStyle(color: AppTheme.textHighlight),),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text("Advanced analytics capabilities suppressed, and opportunities lost due to entry barriers,"
                                                  "high cost, probability of failures.",
                                                maxLines: 3,
                                                style: TextStyle(fontSize: 11,
                                                color: AppTheme.textHighlight),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children:  [
                                            Text("•",style: TextStyle(color: AppTheme.textHighlight)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text("Advanced analytics capabilities suppressed, and opportunities lost due to entry barriers,"
                                                  "high cost, probability of failures.",
                                                maxLines: 3,
                                                style: TextStyle(fontSize: 11,
                                                    color: AppTheme.textHighlight),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children:  [
                                            Text("•",style: TextStyle(color: AppTheme.textHighlight)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text("Advanced analytics capabilities suppressed, and opportunities lost due to entry barriers,"
                                                  "high cost, probability of failures.",
                                                maxLines: 3,
                                                style: TextStyle(fontSize: 11,
                                                    color: AppTheme.textHighlight),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children:  [
                                            Text("•",style: TextStyle(color: AppTheme.textHighlight)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text("Advanced analytics capabilities suppressed, and opportunities lost due to entry barriers,"
                                                  "high cost, probability of failures.",
                                                maxLines: 3,
                                                style: TextStyle(fontSize: 11,
                                                    color: AppTheme.textHighlight),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
          ),
        )

    );
  }

}