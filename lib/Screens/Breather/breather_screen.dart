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

class BreatherScreen extends StatefulWidget{
  BreatherState createState()=> BreatherState();
}

class BreatherState extends State<BreatherScreen>{

  final List<Map> myProducts =
  List.generate(8, (index) => {"id": index, "name": "Product $index"})
      .toList();

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
          leading: Icon(Icons.arrow_back_rounded,color: Colors.black,),
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
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: ElevatedButton(
            //       onPressed: (){},
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
          body: SafeArea(
            child: Container(
              child:
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: myProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: (){

                        },
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("Booth 1", style: TextStyle(color: AppTheme.textHighlight,fontWeight: FontWeight.w500),),

                                subtitle: Text(myProducts[index]["name"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,
                                color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      );
                      //   Container(
                      //     alignment: Alignment.topLeft,
                      //   decoration: BoxDecoration(
                      //       color: Colors.amber,
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text("Booth 1"),
                      //       Text(myProducts[index]["name"]),
                      //     ],
                      //   ),
                      // );
                    }),
              ),
            )
          ),
        )

    );
  }

}