import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Bloc/inforte/inforte_event.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/inforte/inforte_bloc.dart';
import '../../Bloc/inforte/inforte_state.dart';
import '../../Models/model_votingQues.dart';

class StallsTabScreen extends StatefulWidget{
  _StallsTabState createState()=>_StallsTabState();

}

class _StallsTabState extends State<StallsTabScreen>{
  final _formKey = GlobalKey<FormState>();

  EnforteBloc? _boothDetails;
  List<VotingQueModel> votingQueList=[];
  String _value = 'Select Booth';

  var items =  ['Select Booth','Booth 1','Booth 2','Booth 3','Booth 4','Booth 5'];


  void initState() {
    // TODO: implement initState
    super.initState();

    _boothDetails = BlocProvider.of<EnforteBloc>(context);
    // _attendenceHistoryBloc!.add(OnLoadingAttendanceHistoryList(userid: Application.user!.id.toString()));
    _boothDetails!.add(OnLoadingVoitingQueList());

  }


  Widget getStallList(List<VotingQueModel> votingQueList){
    if(votingQueList.length <= 0) {
      return
        ListView.builder(
          scrollDirection: Axis.vertical,
          // padding: EdgeInsets.only(left: 5, right: 20, top: 10, bottom: 15),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Theme
                  .of(context)
                  .hoverColor,
              highlightColor: Theme
                  .of(context)
                  .highlightColor,
              enabled: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                          baseColor: Theme
                              .of(context)
                              .hoverColor,
                          highlightColor: Theme
                              .of(context)
                              .highlightColor,
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
                          baseColor: Theme
                              .of(context)
                              .hoverColor,
                          highlightColor: Theme
                              .of(context)
                              .highlightColor,
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
          itemCount: List
              .generate(8, (index) => index)
              .length,
        );
    }
    return
      ListView.builder(
        padding: EdgeInsets.all(15.0),
        itemBuilder: (context, index) {
          return Container(
            // margin: EdgeInsets.only(left:5,right: 5,bottom:8.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card(
                //   child: Padding(
                //     padding: EdgeInsets.all(8),
                //     child:
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             CachedNetworkImage(
                //               filterQuality: FilterQuality.medium,
                //               // imageUrl: Api.PHOTO_URL + widget.users.avatar,
                //               // imageUrl:
                //               //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                //               imageUrl:
                //               "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                //               ,
                //               placeholder: (context, url) {
                //                 return Shimmer.fromColors(
                //                   baseColor: Theme.of(context).hoverColor,
                //                   highlightColor:
                //                   Theme.of(context).highlightColor,
                //                   enabled: true,
                //                   child: Container(
                //                     height: 80,
                //                     width: 80,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(40),
                //                     ),
                //                   ),
                //                 );
                //               },
                //               imageBuilder: (context, imageProvider) {
                //                 return Container(
                //                   height: 80,
                //                   width: 80,
                //                   decoration: BoxDecoration(
                //                     image: DecorationImage(
                //                       image: imageProvider,
                //                       fit: BoxFit.cover,
                //                     ),
                //                     borderRadius: BorderRadius.circular(40),
                //                   ),
                //                 );
                //               },
                //               errorWidget: (context, url, error) {
                //                 return Shimmer.fromColors(
                //                   baseColor: Theme.of(context).hoverColor,
                //                   highlightColor:
                //                   Theme.of(context).highlightColor,
                //                   enabled: true,
                //                   child: Container(
                //                     height:80,
                //                     width: 80,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(40),
                //                     ),
                //                     child: Icon(Icons.error),
                //                   ),
                //                 );
                //               },
                //             ),
                //             SizedBox(
                //               width: 5.0,
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text("Stall Name"),
                //                 Text("Department or description"),
                //               ],
                //             ),
                //             //location
                //             Column(
                //               children: [
                //                 Icon(Icons.location_on),
                //                 Text("Location")
                //               ],
                //             )
                //
                //           ],
                //         ),
                //   ),
                // ),
                 Align(alignment: Alignment.bottomLeft,
                  child: Text(votingQueList[index].question.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight:FontWeight.w600
                    ),),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 5,
                  child: DropdownButtonHideUnderline(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(
                        //   // color: Theme.of(context).dividerColor,
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(20.0),
                        //     border: Border.all(
                        //         color: AppTheme.textHighlight)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, top: 0.0, right: 5.0, bottom: 0.0),
                          child:
                          //updated on 15/06/2021 to change background colour of dropdownbutton
                          new Theme(
                              data: Theme.of(context)
                                  .copyWith(canvasColor: Colors.white),
                              child: DropdownButton(
                                  items:items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items,
                                        child: Text(items)
                                    );
                                  }
                                  ).toList(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                  isExpanded: true,
                                  hint: Text('Select Category',
                                      style: TextStyle(
                                          color: Color(0xFF3F4141))),
                                  value: _value,
                                  onChanged:(String? value){
                                    setState(() {
                                      _value = value!;
                                    });
                                  }
                                ,
                              )),
                        ),
                      )),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          );
        },
        itemCount:votingQueList.length,
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<EnforteBloc, EnforteState>(builder: (context, state) {
      if (state is VotingQueSuccess) {
        votingQueList = state.votingQueList!;
        // pageCount = (productList.length / rowsPerPage).ceilToDouble();
        // _productBloc!.add(OnUpdatePageCnt(productList: productList, rowsPerPage: rowsPerPage));
      }

      return
        SafeArea(
            child: ListView(
              children: [
                Container(
                  height: 480,
                  child: getStallList(votingQueList),),
                Center(
                  child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("Submit",style: TextStyle(fontSize: 18),),
                        style: ElevatedButton.styleFrom(
                          //elevation of button
                          shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      )),
                )
              ],
            ));
    }
    );

  }

}