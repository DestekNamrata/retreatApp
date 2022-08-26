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

class ConferenceScreen extends StatefulWidget{
  ConferenceState createState()=> ConferenceState();
}

class ConferenceState extends State<ConferenceScreen>{

  Widget getAgendaList() {
    return
      ListView.builder(
          scrollDirection: Axis.vertical,
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
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // toolbarHeight: 10.0,
          // backgroundColor: Colors.white,
          // elevation: 0,
          title: Text(Translate.of(context)!.translate("conference"),style: TextStyle(color: Colors.black),),
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


        ),
        body:
      SafeArea(
      child: SingleChildScrollView(
        child:
        Column(
          children: [
            //punch and duration
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: [
                    //punch in
              Expanded(child:Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child:
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         Text("Punch in"),
                         Text("12:30 pm")
                       ],
                     ),
                   ),


              )),
                    SizedBox(width: 5.0,),
                    //duration
                    Expanded(child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Duration(hrs)"),
                            Text("01:56")
                          ],
                        ),
                      ),


                    ))
                  ],
              ),
            ),

            //agenda listing
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
                ),
                child:
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Agenda"),
                  Container(
                      height:400.0,child: getAgendaList())
                ],
              ),
                ),
              ),
            ),
            //live poll
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Live Poll"),
                      Card(
                        elevation: 6.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              //name,image,time
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CachedNetworkImage(
                                        filterQuality: FilterQuality.medium,
                                        // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                                        // imageUrl:
                                        //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                                        imageUrl:
                                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                                            ,
                                        placeholder: (context, url) {
                                          return Shimmer.fromColors(
                                            baseColor: Theme.of(context).hoverColor,
                                            highlightColor:
                                            Theme.of(context).highlightColor,
                                            enabled: true,
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(40),
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
                                              borderRadius: BorderRadius.circular(40),
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return Shimmer.fromColors(
                                            baseColor: Theme.of(context).hoverColor,
                                            highlightColor:
                                            Theme.of(context).highlightColor,
                                            enabled: true,
                                            child: Container(
                                              height:80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(40),
                                              ),
                                              child: Icon(Icons.error),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text("Name Surname")
                                    ],
                                  ),
                                  Text("1 hr ago")
                                ],
                              ),
                              SizedBox(height: 8.0,),

                              //desc
                              Text("Lorem ipsum color sit amet,consectur adipsing fdsgdgsdsgd sgdgsgdsfgdfsgf"),
                              SizedBox(height: 10.0,),
                              //image
                              CachedNetworkImage(
                                filterQuality: FilterQuality.medium,
                                // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                                // imageUrl:
                                //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                                imageUrl:
                                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                                ,
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    baseColor: Theme.of(context).hoverColor,
                                    highlightColor:
                                    Theme.of(context).highlightColor,
                                    enabled: true,
                                    child: Container(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  );
                                },
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  );
                                },
                                errorWidget: (context, url, error) {
                                  return Shimmer.fromColors(
                                    baseColor: Theme.of(context).hoverColor,
                                    highlightColor:
                                    Theme.of(context).highlightColor,
                                    enabled: true,
                                    child: Container(
                                      height: 180,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(Icons.error),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.0,),

                              //submit button
                              AppButton(
                                text: "Submit",
                                onPressed: (){},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

}