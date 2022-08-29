import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanSuccessScreen extends StatefulWidget{
  String? msg;
  ScanSuccessScreen({Key? key,@required this.msg}):super(key: key);
  _ScanSuccessState createState()=>_ScanSuccessState();
}

class _ScanSuccessState extends State<ScanSuccessScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.msg!,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}