import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/GenerateQR/scanQrCode.dart';
import 'package:flutter_app/Widgets/app_button.dart';

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
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter-Bold'
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0,),
              //continue
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppButton(
                  onPressed: () async{
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScanQR()));
                  },
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  text: 'Continue to Scan',
                  disableTouchWhenLoading: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}