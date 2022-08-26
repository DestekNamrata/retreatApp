import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/translate.dart';

class TicketScreen extends StatefulWidget{
  TicketState createState()=>TicketState();
}

class TicketState extends State<TicketScreen>{

  Widget getTicketList(){
    return
      ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top:8.0),

            child: Card(
              elevation:5.0 ,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Arrival Ticket",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),),
                            SizedBox(height: 10.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Reporting Time",style: TextStyle(fontSize: 12.0),),
                                    SizedBox(height: 5.0,),
                                    Text("12:30 pm",style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600),),

                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Departure ",style: TextStyle(fontSize: 12.0),),
                                    SizedBox(height: 5.0,),
                                    Text("12:30 pm",style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w600),),

                                  ],
                                )
                              ],
                            ),

                          ],
                        ),

                  ),
                  Container(
                    height: 35.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),

                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                    ),
                    // color: Colors.grey.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child:
                        Text("View",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                        Expanded(child:
                        Text("Download",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.0),),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
      appBar:  AppBar(
        title: Text(Translate.of(context)!.translate("ticket"),style: TextStyle(color: Colors.black),),
    ),
      body: Container
        (
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text("Hi name surname",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600)),
                    SizedBox(height: 10.0,),
                    Text(Translate.of(context)!.translate("ticket_desc")),

                  ],
                ),
              ),
            ),

            //get ticket
            Expanded(child:getTicketList())
          ],
        ),
      ),
      ),
    );
  }

}