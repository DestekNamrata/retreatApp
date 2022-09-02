import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/login/login_bloc.dart';
import 'package:flutter_app/Bloc/login/login_event.dart';
import 'package:flutter_app/Bloc/login/login_state.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/GenerateQR/scanQrCode.dart';
import 'package:flutter_app/Screens/Profile/AttendanceHistory/attendance_history.dart';
import 'package:flutter_app/Screens/Profile/privacy_policy.dart';
import 'package:flutter_app/Screens/Profile/ticket_screen.dart';
import 'package:flutter_app/Screens/Profile/yours_ticket_screen.dart';
import 'package:flutter_app/Screens/sign_in_screen.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

import '../../Configs/image.dart';
import '../mainNavigation.dart';
import '../sos_screen.dart';
import 'feedback.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  LoginBloc? _loginBloc;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  // UserName(){
  //   if(Application.user!=null){
  //     userName = Application.user!.name.toString();
  //     nameparts = userName!.split(" ");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE2E7EE),
        leading: SizedBox(),
        elevation: 0,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close,color: Colors.black,),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MainNavigation())),
            
          ),
        ],
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xFFE2E7EE),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //         CachedNetworkImage(
                    //         placeholder: (context, url) =>
                    //      CircularProgressIndicator(),
                    //   imageUrl: 'https://via.placeholder.com/200x150',
                    //
                    // ),
                    // CachedNetworkImage(
                    //   filterQuality: FilterQuality.medium,
                    //   // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                    //   // imageUrl:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                    //   imageUrl:
                    //   "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                    //   placeholder: (context, url) {
                    //     return Shimmer.fromColors(
                    //       baseColor: Theme.of(context).hoverColor,
                    //       highlightColor: Theme.of(context).highlightColor,
                    //       enabled: true,
                    //       child: Container(
                    //         height: 120,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(60),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   imageBuilder: (context, imageProvider) {
                    //     return Container(
                    //       height: 120,
                    //       width: 120,
                    //       decoration: BoxDecoration(
                    //         image: DecorationImage(
                    //           image: imageProvider,
                    //           fit: BoxFit.cover,
                    //         ),
                    //         borderRadius: BorderRadius.circular(60),
                    //       ),
                    //     );
                    //   },
                    //   errorWidget: (context, url, error) {
                    //     return Shimmer.fromColors(
                    //       baseColor: Theme.of(context).hoverColor,
                    //       highlightColor: Theme.of(context).highlightColor,
                    //       enabled: true,
                    //       child: Container(
                    //         height: 120,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(60),
                    //         ),
                    //         child: Icon(Icons.error),
                    //       ),
                    //     );
                    //   },
                    // ),

                   Initicon(
                     text: Application.user!.name.toString(),
                     backgroundColor: AppTheme.appColor,
                     size: 130,
                   ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Application.user!.name.toString(),
                          style: TextStyle(fontSize: 16,color: Color(0xFFEA357C),fontWeight:FontWeight.bold),),
                        // SizedBox(width: 10,),
                        // Image.asset(
                        //   Images.EditProfile,
                        //   width: 20.0,
                        //   height: 20.0,
                        // ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(Application.user!.mobile.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttendanceHistory()));
                        },
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:  BorderRadius.circular(5.0),
                              color: Color(0xffE2E7EE),
                              //color: Colors.indigo,
                              // border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      Images.AH,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          title: Text(
                              Translate.of(context)!.translate('attendance')),
                        )),
                    ListTile(
                      leading: Container(
                        width: 40,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:  BorderRadius.circular(5.0),
                          color: Color(0xffE2E7EE),
                          //color: Colors.indigo,
                          // border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  Images.TS,
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      title: Text(
                          Translate.of(context)!.translate('statistics')),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SOSScreen()));
                      },
                      child: ListTile(
                        title: Text(Translate.of(context)!.translate('sos')),
                        leading: Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:  BorderRadius.circular(5.0),
                            color: Color(0xffE2E7EE),
                            //color: Colors.indigo,
                            // border: Border.all(color: Colors.black, width: 1)
                          ),
                          child: Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    Images.SS,
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(Translate.of(context)!.translate('terms')),
                      leading: Container(
                        width: 40,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:  BorderRadius.circular(5.0),
                          color: Color(0xffE2E7EE),
                          //color: Colors.indigo,
                          // border: Border.all(color: Colors.black, width: 1)
                        ),
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Center(
                                child: Image.asset(
                                  Images.TC,
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicyScreen()));
                        },
                        child: ListTile(
                          title: Text(Translate.of(context)!
                              .translate('privacy_policy')),
                          leading: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:  BorderRadius.circular(5.0),
                              color: Color(0xffE2E7EE),
                              //color: Colors.indigo,
                              // border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      Images.PP,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedbackScreen()));
                      },
                      child: ListTile(
                        title:
                        Text(Translate.of(context)!.translate('feedback')),
                        leading: Container(
                          width: 40,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:  BorderRadius.circular(5.0),
                            color: Color(0xffE2E7EE),
                            //color: Colors.indigo,
                            // border: Border.all(color: Colors.black, width: 1)
                          ),
                          child: Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    Images.Feedback,
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YoursTicketScreen()));
                        },
                        child: ListTile(
                          title: Text(
                              Translate.of(context)!.translate('ticket')),
                          leading: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:  BorderRadius.circular(5.0),
                              color: Color(0xffE2E7EE),
                              //color: Colors.indigo,
                              // border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Icon(Icons.add_chart,color: Color(0xFFEA357C))
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),

                    //scan qr code
                    if (Application.user!.role == 1) //0 for regular 1=scanner
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScanQR()));
                        },
                        child: ListTile(
                          title: Text(
                              Translate.of(context)!.translate('scan_qr')),
                          leading: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:  BorderRadius.circular(5.0),
                              color: Color(0xffE2E7EE),
                              //color: Colors.indigo,
                              // border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Icon(Icons.qr_code,color: Color(0xFFEA357C))
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),

                    //logout
                    BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, logout) {
                          return BlocListener<LoginBloc, LoginState>(
                              listener: (context, state) {
                                if (state is LogoutSuccess) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()),
                                        (Route<dynamic> route) => false,
                                  );
                                }
                              },
                              //                     child: InkWell(
                              // onTap: () async{
                              //     await FirebaseAuth.instance.signOut();
                              //     _loginBloc!.add(OnLogout());
                              //   },
                              //                       child: ListTile(
                              //                   title: Text(
                              //                   "Logout"),
                              //                         leading: Container(
                              //                         width: 40,
                              //                         height: 35,
                              //                         decoration: BoxDecoration(
                              //                         shape: BoxShape.rectangle,
                              //                         borderRadius:  BorderRadius.circular(5.0),
                              //                         color: Color(0xffE2E7EE),
                              //                         //color: Colors.indigo,
                              //                         // border: Border.all(color: Colors.black, width: 1)
                              //                         ),
                              //                         child: Container(
                              //                         width: 35,
                              //                         height: 35,
                              //                         alignment: Alignment.center,
                              //                         child: Stack(
                              //                         children: [
                              //                         Center(
                              //                         child: Image.asset(
                              //                           Images.Logout,
                              //                           width: 20.0,
                              //                           height: 20.0,
                              //                         ),
                              //                         ),
                              //                         ],
                              //                         ),
                              //                         ),
                              //                         ),
                              //                         ),
                              //                     ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppButton(
                                  onPressed: () async{
                                    await FirebaseAuth.instance.signOut();
                                    _loginBloc!.add(OnLogout());
                                  },
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                                  text: 'Logout',
                                  loading: logout is LogoutLoading,
                                  disableTouchWhenLoading: true,
                                ),
                              )
                            //                   child: AppButton(
                            //                       onPressed: () async{
                            //                         await FirebaseAuth.instance.signOut();
                            //                         _loginBloc!.add(OnLogout());
                            //                       },
                            //                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                            //                       text: 'Logout',
                            //                       loading: logout is LogoutLoading,
                            //                       disableTouchWhenLoading: true,
                            //                     )
                          );
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
