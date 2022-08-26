import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/Infobeats/detailsTab.dart';
import 'package:flutter_app/Screens/Infobeats/stallTab.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import '../sos_screen.dart';

import '../../Utils/translate.dart';


class InfobeatsScreen extends StatefulWidget{
  InfobeatsState createState()=>InfobeatsState();
}

class InfobeatsState extends State<InfobeatsScreen> with TickerProviderStateMixin{
  List<Tab> _tabs = [];
  // List<ComboPack> mArrayListTab = [];
  List<Widget> _generalWidgets = [];
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  TabController getTabController() {
    return TabController(length: _tabs.length, vsync: this)
      ..addListener(_updatePage);
  }
  void _updatePage() {
    setState(() {});
  }
  //Tab helpers
  bool isFirstPage() {
    return _tabController!.index == 0;
  }

  bool isLastPage() {
    return _tabController!.index == _tabController!.length - 1;
  }

  List<Widget> getWidgets() {
    _generalWidgets.clear();
    for (int i = 0; i < 3; i++) {
      _generalWidgets.add(getWidget());
    }
    return _generalWidgets;
  }

  Widget getWidget() {
    return
      ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, index) {
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
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Room No.1"),
                            Text("August 31"),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Expand Child',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                '11:00:06',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ]),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                              'Nullam suscipit risus pulvinar, hendrerit nisi quis, vehicula ante. Morbi ut diam elit. '
                              'Praesent non justo sodales, auctor lacus id, congue massa. '
                              'Duis ac odio dui. Sed sed egestas metus.',

                        ),
                        // RaisedButton(
                        //   child: Text('Button0'),
                        //   onPressed: () => print('Pressed button0'),
                        // ),
                        ExpandChild(
                          child: Column(
                            children: <Widget>[
                              Text("Duis ac odio dui. Sed sed egestas metus. Donec hendrerit velit magna. ")
                              // RaisedButton(
                              //   child: Text('Button1'),
                              //   onPressed: () => print('Pressed button1'),
                              // ),
                              // RaisedButton(
                              //   child: Text('Button2'),
                              //   onPressed: () => print('Pressed button2'),
                              // ),
                              // RaisedButton(
                              //   child: Text('Button3'),
                              //   onPressed: () => print('Pressed button3'),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount:6,
      );
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          title: Text(Translate.of(context)!.translate("infobeats"),style: TextStyle(color: Colors.black),),
            // automaticallyImplyLeading: false,
            actions: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSScreen()));
                      },
                      child:Container(
                          width: 55.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(35.0),

                          ),
                          child:Padding(
                              padding: EdgeInsets.all(3.0),
                              child:Text(textAlign: TextAlign.center,"SOS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.0),))
                      )),

                  InkWell(
                      onTap: () {
                      },
                      child: Stack(children: [
                        // IconButton(
                        //   icon:
                        Image.asset(
                          Images.notiIcon,
                          width: 37.0,
                          height: 37.0,
                        ),
                        // tooltip: "Save Todo and Retrun to List",
                        //   onPressed: () {},
                        // ),
                        Positioned(
                          right: 5,
                          top: 1,
                          child: new Container(
                            padding: EdgeInsets.all(1),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8.5),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 17,
                              minHeight: 4,
                            ),
                            child: Text(
                              "0",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins'
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // if(Application.user.userType=="1")//for fleet
                        // Positioned(
                        //   right: 5,
                        //   top: 5,
                        //   child: new Container(
                        //     padding: EdgeInsets.all(1),
                        //     decoration: new BoxDecoration(
                        //       color: Colors.red,
                        //       borderRadius: BorderRadius.circular(8.5),
                        //     ),
                        //     constraints: BoxConstraints(
                        //       minWidth: 17,
                        //       minHeight: 17,
                        //     ),
                        //     child: Text(
                        //       "0",
                        //       style: new TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 10,
                        //           fontWeight: FontWeight.w400,
                        //           fontFamily: 'Poppins'
                        //       ),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // )
                      ],
                      )),
                  //profile
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.account_circle_rounded,color: Colors.grey,size: 30.0,),
                      )

                  ),

                ],
              )
            ],
          bottom: const TabBar(
            labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
            tabs: [
            Tab(
                      text: "Details",
                    ),
                    Tab(
                      text: "Stalls",
                    ),
              // Tab(icon: Icon(Icons.camera_alt)),
              // Tab(icon: Icon(Icons.grade)),
              // Tab(icon: Icon(Icons.email)),
            ],
          ), // TabBar
          // toolbarHeight: 10.0,
          backgroundColor: Colors.grey,
          elevation: 0,
        ), // AppBar
        body:TabBarView(
          children: [
            // Icon(Icons.music_note),
            // Icon(Icons.music_video),
            // Icon(Icons.camera_alt),
            // Icon(Icons.grade),
            // Icon(Icons.email),
            DetailsTab(),
            StallsTabScreen()
          ],
        ), // TabBarView
      ), // Scaffold
    );
  }

}