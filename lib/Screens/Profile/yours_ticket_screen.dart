import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Profile/pdf_viewer_page.dart';
import 'package:flutter_app/Screens/Profile/profile_screen.dart';
import 'package:flutter_app/Widgets/app_button.dart';

import '../../Configs/image.dart';
import '../../Configs/theme.dart';
import '../sos_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class YoursTicketScreen extends StatefulWidget{
  _YoursTicketScreenState createState()=>_YoursTicketScreenState();
}

class _YoursTicketScreenState extends State<YoursTicketScreen>{
  @override

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }

  void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
          ),
        ),
      );
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
      body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Your Tickets",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),)),
              ),

              InkWell(
                onTap: () async {
                  const url =
                      "http://www.africau.edu/images/default/sample.pdf";
                  final file = await loadPdfFromNetwork(url);
                  openPdf(context, file, url);
                },
                child: Container(
                  width: 265,
                  height: 265,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          Images.Ticket22Sept,
                          width: 260.0,
                          height: 260.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // For Ticket 25
              Container(
                width: 265,
                height: 265,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        Images.Ticket25Sept,
                        width: 260.0,
                        height: 260.0,
                      ),
                    ),
                  ],
                ),
              ),


            ],
          )

      ),
    );
  }

}