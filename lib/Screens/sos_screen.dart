import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/app_button.dart';

class SOSScreen extends StatefulWidget{
  _SOSState createState()=>_SOSState();
}

class _SOSState extends State<SOSScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS"),
      ),
      body: Container(
        child: Column(
          children: [
            //contact us
            Card(
                margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
              elevation: 6,
                child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Contact Us"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 15.0),
                  child: Text("Please find the details below"),
                ),
                Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),

                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("Mobile number"),
                          Text("+919876543456"),
                        ],
                      )),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                      ),
    Expanded(child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sent message at"),
                          Text("+919876543456"),
                        ],
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
                      child: Text("For Emergency"),
                    ),

                   Padding(
                     padding: EdgeInsets.all(15.0),
                       child: AppButton(
                      onPressed: (){},
                      text: "Send SOS Now",
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ))
                  ],
                )),

          ],
        )

      ),
    );
  }

}