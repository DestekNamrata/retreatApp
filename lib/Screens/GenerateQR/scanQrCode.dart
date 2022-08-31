// import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter_app/Bloc/scanAndGetData/bloc.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Screens/GenerateQR/scanSuccessScreen.dart';
import 'package:flutter_app/Widgets/app_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "";
  ScanResult? scanResult;
  var dropdownValue;

  List<String> spinnerItems = [
    "Room 1",
    "Room 2",
    "Room 3",
    "Room 4",
    "Room 5",
    "Room 6",
    "Room 7",
    "Room 8"
  ];

  ScanAndGetDataBloc? scanAndGetDataBloc;

  // String dropDownId="",dropdownRoomId="";
  int? attendanceType; //for no

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = null;

    scanAndGetDataBloc = BlocProvider.of<ScanAndGetDataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Select Attendance Type :-",
              style: TextStyle(
                  fontFamily: 'Inter-SemiBold',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: -1,
                  color: Colors.black),
            ),

            //hotel
            Row(
              children: [
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.grey,
                      // selectedRowColor: Theme.of(context).primaryColor
                    ),
                    child: Radio<int>(
                      value: 1,
                      groupValue: attendanceType,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppTheme.appColor),
                      onChanged: (int? value) {
                        setState(() {
                          attendanceType = value;
                          dropdownValue = null;
                        });
                      },
                    )),
                Text(
                  'Hotel Check In/checkout',
                  style: TextStyle(
                      fontFamily: 'Inter-SemiBold',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.black),
                ),
              ],
            ),
            //inforte
            Row(
              children: [
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.grey,
                      // selectedRowColor: Theme.of(context).primaryColor
                    ),
                    child: Radio<int>(
                      value: 2,
                      groupValue: attendanceType,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppTheme.appColor),
                      onChanged: (int? value) {
                        setState(() {
                          attendanceType = value;
                          dropdownValue = null;
                          // controller.onChangehasgst;
                        });
                      },
                    )),
                Text(
                  'Inforte - checkin/checkout',
                  style: TextStyle(
                      fontFamily: 'Inter-SemiBold',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ],
            ),
            //unconference
            Row(
              children: [
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.grey,
                      // selectedRowColor: Theme.of(context).primaryColor
                    ),
                    child: Radio<int>(
                      value: 3,
                      groupValue: attendanceType,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppTheme.appColor),
                      onChanged: (int? value) {
                        setState(() {
                          attendanceType = value;
                          dropdownValue == null;
                          // controller.onChangehasgst;
                        });
                      },
                    )),
                Text(
                  'Unconference - checkin/checkout',
                  style: TextStyle(
                      fontFamily: 'Inter-SemiBold',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ],
            ),
            //breather
            Row(
              children: [
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.grey,
                      // selectedRowColor: Theme.of(context).primaryColor
                    ),
                    child: Radio<int>(
                      value: 4,
                      groupValue: attendanceType,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => AppTheme.appColor),
                      onChanged: (int? value) {
                        setState(() {
                          attendanceType = value;
                          dropdownValue = null;
                          // controller.onChangehasgst;
                        });
                      },
                    )),
                Text(
                  'Breather - checkin/checkout',
                  style: TextStyle(
                      fontFamily: 'Inter-SemiBold',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ],
            ),
            attendanceType == 4
                ?
                //dropdown
                DropdownButtonHideUnderline(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context)
                                  .unselectedWidgetColor
                                  .withOpacity(0.5)),
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: DropdownButton(
                          hint: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Select Breather- Check in/Check out',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color:
                                        Theme.of(context).unselectedWidgetColor,
                                    fontFamily: 'Inter-Regular'),
                              )),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              fontFamily: 'Inter-Regular'),
                          items: spinnerItems
                              .map((items) => DropdownMenuItem<String>(
                                    value: items,
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Inter-Regular'),
                                        )),
                                  ))
                              .toList(),
                          value: dropdownValue,
                          onChanged: (value) {
                            setState(
                              () {
                                dropdownValue = value;
                                // print(_dropDownValue);
                              },
                            );
                          },
                        )))
                : Container(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),

            // Button to scan QR code
            BlocBuilder<ScanAndGetDataBloc, ScanAndGetDataState>(
                builder: (context, scan) {
              return BlocListener<ScanAndGetDataBloc, ScanAndGetDataState>(
                listener: (context, state) {
                  if (state is ScanQrCodeSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScanSuccessScreen(msg: state.msg)));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: AppButton(
                    onPressed: () async {
                      if (attendanceType != null ) {
                        if(attendanceType==4 && dropdownValue==null){
                          Fluttertoast.showToast(
                              msg: "Please select Room");
                        }else{

                          final codeSanner = await BarcodeScanner.scan(); //barcode scanner
                          setState(() {
                            // qrCodeResult = codeSanner;
                            scanResult = codeSanner;
                            if (scanResult!.rawContent.toString() != "") {
                              scanAndGetDataBloc!.add(OnScanQrCode(
                                  attendanceType: attendanceType.toString(),
                                  room_no: dropdownValue.toString()));
                            }
                          });
                        }

                      } else {
                        Fluttertoast.showToast(
                            msg: "Please select Attendance Type");
                      }

                      // qrCodeResult=scanResult!.rawContent.toString();
                    },
                    text: "Open Scanner",
                    //Button having rounded rectangle border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    loading: scan is ScanDataLoading,
                    disableTouchWhenLoading: true,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
