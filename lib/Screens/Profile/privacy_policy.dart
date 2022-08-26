import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/translate.dart';
// import 'package:in_app_webview/in_app_webview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';



class PrivacyPolicyScreen extends StatefulWidget{
   _PrivacyPolicyState createState()=>_PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicyScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Translate.of(context)!.translate("privacy_policy")),
      ),
      body:
      // InAppWebView(
      //   "https://www.google.com/",
      // ),
    InAppWebView(
    initialUrlRequest: URLRequest(url: Uri.parse("https://www.google.com/")),
    initialOptions: InAppWebViewGroupOptions(
    crossPlatform:
    InAppWebViewOptions(useShouldOverrideUrlLoading: true),
    )),
    );
  }
  
}