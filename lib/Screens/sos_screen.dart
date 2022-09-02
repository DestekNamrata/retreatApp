import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/model_login.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/Utils/application.dart';

import '../Bloc/Sos/sos_bloc.dart';
import '../Bloc/Sos/sos_event.dart';
import '../Bloc/Sos/sos_state.dart';
import '../Configs/image.dart';
import '../Configs/theme.dart';
import 'Profile/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SOSScreen extends StatefulWidget{
  var userId;
  SOSScreen({Key? key, this.userId}) : super(key: key);
  _SOSState createState()=>_SOSState();
}

class _SOSState extends State<SOSScreen>{
  @override
  SOSBloc? _sosBloc;
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sosBloc = BlocProvider.of<SOSBloc>(context);
    // _sosBloc!.add(GetSOS(
    //     userId: Application.user!.id.toString()));
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          // toolbarHeight: 10.0,
          backgroundColor: Colors.white,
          elevation: 0,
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

        body:BlocBuilder<SOSBloc, SOSState>(builder: (context, state) {
          if(state is GetsosSuccess){
            Fluttertoast.showToast(msg: state.msg!);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            Navigator.pop(context);
          }
          return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Save Our Soul (SOS)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),)),
                  ),
                  //contact us
                  Card(
                      margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                      elevation: 6,
                      child:Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Contact Us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15.0),
                            child: Text("Please find the details below",style: TextStyle(fontSize: 14,color: Color(0xff889DAC)),),
                          ),
                          Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Color(0xff8018BB),

                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Text("Mobile number",style: TextStyle(fontSize: 10,color: Colors.white),),
                                      SizedBox(height: 5,),
                                      Text("+91 9876543456",style: TextStyle(fontSize: 14,color: Colors.white),),
                                    ],
                                  ),
                                )),
                                Text("|",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                                // VerticalDivider(
                                //   color: Colors.black,
                                //   thickness: 2,
                                // ),
                                Expanded(child:Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sent message at",style: TextStyle(fontSize: 10,color: Colors.white)),
                                      SizedBox(height: 5,),
                                      Text("+91 9876543456",style: TextStyle(fontSize: 14,color: Colors.white),),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )
                        ],
                      )),

                  //for emergency
                  Card(
                      margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                      elevation: 6,
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0,right: 8.0,top:20.0),
                            child: Text("For Emergency",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black)),
                          ),

                          Padding(
                              padding: EdgeInsets.all(15.0),
                              child: AppButton(
                                onPressed: (){
                                  _sosBloc!.add(GetSOS(userId: Application.user!.id.toString()));
                                },
                                text: "Send SOS Now",
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                              ))
                        ],
                      )),

                ],
              )

          );
        })

    );
  }

}