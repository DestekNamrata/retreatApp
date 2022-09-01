import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Bloc/inforte/inforte_event.dart';
import 'package:flutter_app/Utils/application.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/inforte/inforte_bloc.dart';
import '../../Bloc/inforte/inforte_state.dart';
import '../../Configs/theme.dart';
import '../../Models/model_boothDetails.dart';

class DetailsTab extends StatefulWidget{
  _DetailsState createState()=>_DetailsState();
}

class _DetailsState extends State<DetailsTab>{


  EnforteBloc? _boothDetails;
  List<BoothDetailsModel> boothDetailsList=[];
  String? punchInTime;

  void initState() {
    // TODO: implement initState
    super.initState();

    _boothDetails = BlocProvider.of<EnforteBloc>(context);
    // _attendenceHistoryBloc!.add(OnLoadingAttendanceHistoryList(userid: Application.user!.id.toString()));
    _boothDetails!.add(OnLoadingBoothDetailsList(userid: Application.user!.id.toString()));

  }

  Widget getAgendaList(List<BoothDetailsModel> boothDetailsList) {
    if(boothDetailsList.length <= 0) {
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
                              Text(
                                boothDetailsList[index].stallName.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.textHighlight,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ]),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  boothDetailsList[index].title.toString(),
                              style: TextStyle(fontWeight: FontWeight.w600,
                              fontSize: 16),),
                              // Text(
                              //     'Fast >> Faster >>> Fastest >>>>'),
                            ],
                          ),
                        ),

                        // RaisedButton(
                        //   child: Text('Button0'),
                        //   onPressed: () => print('Pressed button0'),
                        // ),
                        ExpandChild(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10,),
                              Text(boothDetailsList[index].description.toString())
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
        itemCount:boothDetailsList.length,
      );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<EnforteBloc, EnforteState>(builder: (context, state) {
      if (state is BoothDetailsSuccess) {
        boothDetailsList = state.boothDetailsList!;
        punchInTime = state.punchIn;
        // pageCount = (productList.length / rowsPerPage).ceilToDouble();
        // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
      }

      return
        SafeArea(
          child: SingleChildScrollView(
            child:
            Container(
              color: Theme.of(context)
                  .dividerColor,

              child: Column(
                children: [
                  // SizedBox(
                  //   height: 10,
                  // ),

                  //punch and duration

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.appColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),

                      child: Row(
                        children: [

                          //punch in
                          Expanded(child:Container(
                            decoration: BoxDecoration(
                              // color: AppTheme.appColor,
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Punch in" ,style: TextStyle(color: Colors.white)),
                                  Text(punchInTime.toString(),
                                      style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18))
                                ],
                              ),
                            ),


                          )),
                          // SizedBox(width: 5.0,),

                          // SizedBox(
                          //   height: 50,
                          //   child: VerticalDivider(
                          //     thickness: 2,
                          //     indent: 13,
                          //     endIndent: 13,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          //duration
                          // Expanded(child: Container(
                          //
                          //   decoration: BoxDecoration(
                          //     // color: AppTheme.appColor,
                          //       borderRadius: BorderRadius.circular(8.0)
                          //   ),
                          //   child:
                          //   Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Column(
                          //       children: [
                          //         Text("Duration", style: TextStyle(color: Colors.white),),
                          //         Text("01:56 hrs", style: TextStyle(color: Colors.white,
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 18))
                          //       ],
                          //     ),
                          //   ),
                          //
                          //
                          // ))
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  //agenda listing
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.0)
                      ),
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
                                height:400.0,child: getAgendaList(boothDetailsList))
                          ],
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),


                  //live poll
                  // Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(13.0)
                  //     ),
                  //     child:
                  //     Padding(
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text("Live Poll", style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //           fontFamily: 'Inter-Regular'
                  //       ),),
                  //           Card(
                  //             elevation: 6.0,
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Column(
                  //                 children: [
                  //                   //name,image,time
                  //                   Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       Row(
                  //                         children: [
                  //                           CachedNetworkImage(
                  //                             filterQuality: FilterQuality.medium,
                  //                             // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                  //                             // imageUrl:
                  //                             //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                  //                             imageUrl:
                  //                             "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                  //                             ,
                  //                             placeholder: (context, url) {
                  //                               return Shimmer.fromColors(
                  //                                 baseColor: Theme.of(context).hoverColor,
                  //                                 highlightColor:
                  //                                 Theme.of(context).highlightColor,
                  //                                 enabled: true,
                  //                                 child: Container(
                  //                                   height: 80,
                  //                                   width: 80,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Colors.white,
                  //                                     borderRadius: BorderRadius.circular(40),
                  //                                   ),
                  //                                 ),
                  //                               );
                  //                             },
                  //                             imageBuilder: (context, imageProvider) {
                  //                               return Container(
                  //                                 height: 80,
                  //                                 width: 80,
                  //                                 decoration: BoxDecoration(
                  //                                   image: DecorationImage(
                  //                                     image: imageProvider,
                  //                                     fit: BoxFit.cover,
                  //                                   ),
                  //                                   borderRadius: BorderRadius.circular(40),
                  //                                 ),
                  //                               );
                  //                             },
                  //                             errorWidget: (context, url, error) {
                  //                               return Shimmer.fromColors(
                  //                                 baseColor: Theme.of(context).hoverColor,
                  //                                 highlightColor:
                  //                                 Theme.of(context).highlightColor,
                  //                                 enabled: true,
                  //                                 child: Container(
                  //                                   height:80,
                  //                                   width: 80,
                  //                                   decoration: BoxDecoration(
                  //                                     color: Colors.white,
                  //                                     borderRadius: BorderRadius.circular(40),
                  //                                   ),
                  //                                   child: Icon(Icons.error),
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
                  //                   SizedBox(height: 8.0,),
                  //
                  //                   //desc
                  //                   Text("Lorem ipsum color sit amet,consectur adipsing fdsgdgsdsgd sgdgsgdsfgdfsgf"),
                  //                   SizedBox(height: 10.0,),
                  //                   //image
                  //                   CachedNetworkImage(
                  //                     filterQuality: FilterQuality.medium,
                  //                     // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                  //                     // imageUrl:
                  //                     //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                  //                     imageUrl:
                  //                     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                  //                     ,
                  //                     placeholder: (context, url) {
                  //                       return Shimmer.fromColors(
                  //                         baseColor: Theme.of(context).hoverColor,
                  //                         highlightColor:
                  //                         Theme.of(context).highlightColor,
                  //                         enabled: true,
                  //                         child: Container(
                  //                           height: 180,
                  //                           width: MediaQuery.of(context).size.width,
                  //                           decoration: BoxDecoration(
                  //                             color: Colors.white,
                  //                             borderRadius: BorderRadius.circular(5),
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                     imageBuilder: (context, imageProvider) {
                  //                       return Container(
                  //                         height: 180,
                  //                         width: MediaQuery.of(context).size.width,
                  //                         decoration: BoxDecoration(
                  //                           image: DecorationImage(
                  //                             image: imageProvider,
                  //                             fit: BoxFit.cover,
                  //                           ),
                  //                           borderRadius: BorderRadius.circular(5),
                  //                         ),
                  //                       );
                  //                     },
                  //                     errorWidget: (context, url, error) {
                  //                       return Shimmer.fromColors(
                  //                         baseColor: Theme.of(context).hoverColor,
                  //                         highlightColor:
                  //                         Theme.of(context).highlightColor,
                  //                         enabled: true,
                  //                         child: Container(
                  //                           height: 180,
                  //                           width: MediaQuery.of(context).size.width,
                  //                           decoration: BoxDecoration(
                  //                             color: Colors.white,
                  //                             borderRadius: BorderRadius.circular(5),
                  //                           ),
                  //                           child: Icon(Icons.error),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //                   SizedBox(height: 10.0,),
                  //
                  //                   //submit button
                  //                   AppButton(
                  //                     text: "Submit",
                  //                     onPressed: (){},
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
            ),
          ),
        );
    }
    );

  }

}