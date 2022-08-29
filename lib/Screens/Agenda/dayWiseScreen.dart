import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Configs/theme.dart';

class DayWiseScreen extends StatefulWidget{
  String? title;
  DayWiseScreen({Key? key,@required this.title}):super(key: key);

  _DayWiseState createState()=>_DayWiseState();
}

class _DayWiseState extends State<DayWiseScreen>{
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: AppTheme.appColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.0,),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.title.toString(),style: TextStyle(
                 fontWeight: FontWeight.w600,
                 fontFamily: 'Inter-Bold',
                 fontSize: 20.0,
                 color: Colors.black
               ),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("23 Sept".toString(),style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter-Bold',
                  fontSize: 20.0,
                  color: AppTheme.dayColor
              ),),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Row(children: [
                //start
                Text("Start".toString(),style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter-Bold',
                    fontSize: 14.0,
                    color: Colors.black
                ),),
                SizedBox(width: 18.0,),
                //end
                Text("End".toString(),style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter-Bold',
                    fontSize: 14.0,
                    color: Colors.black
                ),),
                SizedBox(width: 25.0,),
                //activity
                Text("Activity".toString(),style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter-Bold',
                    fontSize: 14.0,
                    color: Colors.black
                ),),

              ],),
            ),
            Expanded(
                child:ListView.builder(
              itemCount: 3,
                itemBuilder: (context,index){
              return Container(
                child: Row(children: [
                   Expanded(
                       child:
                ListTileTheme(
                dense: true,
                    child:ExpansionTile(
                         // trailing: Icon(
                         //
                         //   _customTileExpanded
                         //       ?  Icons.arrow_downward_outlined
                         //       :
                         //   Icons.arrow_forward_ios,
                         //   size: 15.0,color: Colors.black,
                         // ),
                    // trailing: Text(''),
                      onExpansionChanged: (bool expanded) {
                                  setState(() => _customTileExpanded = expanded);
                                },
                    title:
                        SizedBox(
                          height:25.0,
                          child: Row(
                    children: [
                      Text("11:00".toString(),style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter-Regular',
                            fontSize: 14.0,
                            color: Colors.black
                      ),),
                      SizedBox(width: 15.0,),
                      Text("13:00".toString(),style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter-Regular',
                            fontSize: 14.0,
                            color: Colors.black
                      ),),
                      SizedBox(width: 15.0,),
                      Text("Hotel Check-in".toString(),style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter-Regular',
                            fontSize: 14.0,
                            color: Colors.black
                      ),),
              ]
                ),
                        ),

                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:15.0,bottom: 8.0,right: 15.0),
                      child: Align(alignment: Alignment.bottomLeft,child:  Text(
                            "fdfffffgfgfg",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w600,color: AppTheme.textColor,fontSize: 15.0),

                        )),
                    )
                    ],
                  ))
                   )


                ],),
              );
            }))
          ],),
      ),
    );
  }

}