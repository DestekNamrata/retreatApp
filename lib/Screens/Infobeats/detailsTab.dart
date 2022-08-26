import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:shimmer/shimmer.dart';

class DetailsTab extends StatefulWidget{
  _DetailsState createState()=>_DetailsState();
}

class _DetailsState extends State<DetailsTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
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
                          // Container(
                          //     height:400.0,child: getAgendaList())
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
        );
  }

}