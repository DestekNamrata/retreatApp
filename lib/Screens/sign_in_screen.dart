import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/image.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/OtpScreen.dart';
import 'package:flutter_app/Utils/translate.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';



class SignInScreen extends StatefulWidget{

  _SignInScreenState createState()=>_SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>{
  final TextEditingController _mobilecontroller = TextEditingController();
  // OTPVerify otpVerify=new OTPVerify();
  var countrycode;
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  String authStatus="";
  bool loading=false;
  var verificationId;


  Future<void> _showMessage(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Sign In",
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ok",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> verifyPhoneNumber(BuildContext context,String number) async {

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91"+number,
        timeout: const Duration(seconds: 15),
        verificationCompleted: (AuthCredential authCredential) {
          //  signIn(authCredential);
          print('verfication completed called sent called');
          //commented on 14/062021
          // setState(() {
          //   authStatus = "sucess";
          // });
          // if (authStatus != "") {
          //   scaffoldKey?.currentState?.showSnackBar(SnackBar(
          //     content: Text(authStatus),
          //   ));
          // }
        },
        verificationFailed: (FirebaseAuthException authException) {
          print(authException.message.toString() + "Inside auth failed");
          setState(() {
            // authStatus = "Authentication failed";
            authStatus = authException.message!;
          });
          // loader.remove();
          // Helper.hideLoader(loader);
          if (authStatus != "") {
            // scaffoldKey.currentState.showSnackBar(SnackBar(
            //   content: Text(authStatus),
            // ));
            Fluttertoast.showToast(msg: authStatus);

          }
        },
        codeSent: (String? verId, [int? forceCodeResent]) {
          // loader.remove();
          // Helper.hideLoader(loader);
          // this.verificationId = verId;
          setState(() {
            // authStatus = "OTP has been successfully sent";
            // // user.deviceToken = verId;
            verificationId = verId;
            loading=false;
            Navigator.push(context,MaterialPageRoute(builder: (context)=>
                OtpScreen(
                    mobileNum:_mobilecontroller.text,
                  verificationId:verificationId.toString(),
                )));

            //  users.deviceToken = verId;
          });
          // if (authStatus != "") {
          //   scaffoldKey.currentState!.showSnackBar(SnackBar(
          //     content: Text(authStatus),
          //   ));
          // }
        },
        codeAutoRetrievalTimeout: (String verId) {
          // user.deviceToken = verId;
          //    print('coderetreival sent called' + verificationId);
          setState(() {
            authStatus = "TIMEOUT";
          });
        },
      );
    }catch(e){
      print(e);
    }

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key:scaffoldKey,
      // appBar: AppBar(),
      body: Container(

        child: SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(Images.retreatImage,height: 150.0,width:150.0),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Login",
                style: TextStyle(fontFamily: 'Inter-Bold',fontWeight:FontWeight.w600,fontSize: 30.0,color: AppTheme.appColor),
              ),
            ),
            SizedBox(height: 40.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                Translate.of(context)!.translate('input_mobile'),
                style: TextStyle(fontFamily: 'Inter-Regular',fontWeight:FontWeight.normal,fontSize: 14.0,color: Colors.black),
              ),
            ),
            // Row(
            //   children: [
            CountryListPick(
              // appBar: AppBar(
              //   backgroundColor: Colors.amber,
              //   title: Text('Pick your country'),
              // ),
              // if you need custome picker use this
              pickerBuilder: (context, CountryCode? countryCode) {
                countrycode=countryCode!.dialCode.toString();
                return
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            height: 45.0,
                            decoration: const BoxDecoration(
                              color: Color(0xffEA357C),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),

                            child:
                            Align(
                                alignment: Alignment.center,
                                child:Text(countryCode.dialCode.toString(),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),

                                ))),
                        Expanded(
                            child:
                            Container(
                                height: 45.0,
                                // margin: EdgeInsets.only(right: 25.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:   BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                  border: Border.all(

                                    color: Theme.of(context).primaryColor,  // red as border color
                                  ),
                                ),
                                child:
                                Align(
                                  alignment: Alignment.center,
                                  child:
                                  TextFormField(
                                    controller:_mobilecontroller,
                                    style: TextStyle(
                                        fontFamily: 'Poppins-Regular',color: Colors.black,fontSize: 14.0
                                    ),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Phone Number",
                                    ),
                                    onChanged: (value) {
                                      // this.phoneNo=value;
                                      print(value);
                                    },
                                  ),
                                )
                            )
                        ),
                      ],
                    ),
                  );
              },
              // theme: CountryTheme(
              //   isShowFlag: true,
              //   isShowTitle: true,
              //   isShowCode: true,
              //   isDownIcon: false,
              //   showEnglishName: true,
              // ),
              initialSelection: '+91',
              // or
              // initialSelection: 'US'
              onChanged: (CountryCode? code) {
                print(code!.name);
                print(code.code);
                print(code.dialCode);
                print(code.flagUri);
              },
            ),

            //verify phone
            Padding(padding: EdgeInsets.only(top:25.0,left:20.0,right: 20.0),
                child:
                AppButton(
                  onPressed: (){

                    if(_mobilecontroller.text.isEmpty){
                      _showMessage('Please enter mobile number');
                    }else if(_mobilecontroller.text.length!=10){
                      _showMessage('Please enter valid number');

                    }else{
                      // otpVerify.phone=_mobilecontroller.text;
                      // otpVerify.countrycode=countrycode.toString();
                      // otpVerify.flagRoleType=widget.flagRoleType.toString();
                      // // Navigator.pushNamed(context, Routes.otp);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => OtpScreen(),
                      //   ),
                      // );
                      setState(() {
                        loading=true;
                      });
                      verifyPhoneNumber(context, _mobilecontroller.text);
                    }

                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  text: Translate.of(context)!.translate('proceed'),
                  loading: loading,
                  disableTouchWhenLoading: true,
                )
            ),
            // loading==true
            // ?
            // Align(
            //     alignment:Alignment.center,child:CircularProgressIndicator())
            // :
            //     Container(),
            // SizedBox(height: 20.0,),

            //terms and conditions
           // Column(
           //   mainAxisAlignment: MainAxisAlignment.center,
           //
           //   children: [
           //   Text(Translate.of(context)!.translate("tnc"),style: TextStyle(fontSize: 12.0),),
           //   SizedBox(height: 3.0,),
           //   Row(
           //     mainAxisAlignment: MainAxisAlignment.center,
           //     children: [
           //     Text("Terms of use ",style: TextStyle(decoration: TextDecoration.underline,fontSize: 12.0,fontWeight: FontWeight.w500),),
           //     Text(Translate.of(context)!.translate("tnc1"),style: TextStyle(fontSize: 12.0),)
           //
           //   ],),
           //     SizedBox(height: 3.0,),
           //     Row(
           //       mainAxisAlignment: MainAxisAlignment.center,
           //       children: [
           //         Text("our",style: TextStyle(fontSize: 12.0,),),
           //         Text(" Privacy Policy",style: TextStyle(decoration: TextDecoration.underline,fontSize: 12.0,fontWeight: FontWeight.w500),)
           //
           //       ],)
           // ],)

          ],
        )),
      ),
    );
  }


}