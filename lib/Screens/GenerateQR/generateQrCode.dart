import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {

  // String qrData="https://github.com/ChinmayMunje";
  String qrData="123";
  final qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar having title
      appBar: AppBar(
        title: Center(child: Text("Generate QR Code")),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:
        Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Scan QR Code",textAlign:TextAlign.center,style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            QrImage(data: qrData,size:300.0),
            // SizedBox(height: 20),
            // Text("Generate QR Code",style: TextStyle(fontSize: 20),),
            //
            // //TextField for input link
            // TextField(
            //   decoration: InputDecoration(
            //       hintText: "Enter your link here..."
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   //Button for generating QR code
            //   child: FlatButton(
            //     onPressed: () async {
            //       //a little validation for the textfield
            //       if (qrdataFeed.text.isEmpty) {
            //         setState(() {
            //           qrData = "";
            //         });
            //       } else {
            //         setState(() {
            //           qrData = qrdataFeed.text;
            //         });
            //       }
            //     },
            //     //Title given on Button
            //     child: Text("Generate QR Code",style: TextStyle(color: Colors.indigo[900],),),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //       side: BorderSide(color: Colors.black),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
