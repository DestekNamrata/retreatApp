import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/GenerateQR/scanQrCode.dart';
import 'package:flutter_app/Screens/Profile/AttendanceHistory/attendance_history.dart';
import 'package:flutter_app/Screens/Profile/privacy_policy.dart';
import 'package:flutter_app/Screens/Profile/ticket_screen.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';



class ProfileScreen extends StatefulWidget{
  _ProfileState createState()=>_ProfileState();
}

class _ProfileState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(Translate.of(context)!.translate('profile')),),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
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
                    CachedNetworkImage(
                      filterQuality: FilterQuality.medium,
                      // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                      // imageUrl:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      imageUrl:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).highlightColor,
                          enabled: true,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(60),
                            ),

                          ),
                        );
                      },
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,

                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).highlightColor,
                          enabled: true,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Icon(Icons.error),
                          ),
                        );
                      },
                    ),
SizedBox(height: 8.0,),
                    Text("abc"),

                  ],
                ),
              ),
              SizedBox(height: 10.0,),

              Card(
                elevation: 5.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceHistory()));
                     },
                       child:ListTile(title:
                   Text(Translate.of(context)!.translate('attendance')),trailing: Icon(Icons.arrow_forward_ios),)),
                   ListTile(title: Text(Translate.of(context)!.translate('statistics')),trailing: Icon(Icons.arrow_forward_ios)),
                   ListTile(title: Text(Translate.of(context)!.translate('sos')),trailing: Icon(Icons.arrow_forward_ios)),
                   ListTile(title: Text(Translate.of(context)!.translate('terms')),trailing: Icon(Icons.arrow_forward_ios)),
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));
                     },
                       child:ListTile(title:
                   Text(Translate.of(context)!.translate('privacy_policy')),trailing: Icon(Icons.arrow_forward_ios))),
                   ListTile(title: Text(Translate.of(context)!.translate('feedback')),trailing: Icon(Icons.arrow_forward_ios)),
                   InkWell(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));
                     },
                       child:ListTile(title:
                   Text(Translate.of(context)!.translate('ticket')),trailing: Icon(Icons.arrow_forward_ios))),

                    //scan qr code
                    if(Application.user!.role=="1")//0 for regular 1=scanner
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanQR()));
                          },
                          child:ListTile(title:
                          Text(Translate.of(context)!.translate('scan_qr')),trailing: Icon(Icons.arrow_forward_ios))),

                    //logout
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketScreen()));
                        },
                        child:ListTile(title:
                        Text(Translate.of(context)!.translate('logout')),trailing: Icon(Icons.arrow_forward_ios))),
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