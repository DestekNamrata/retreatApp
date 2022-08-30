import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/agenda/agenda_bloc.dart';
import 'package:flutter_app/Bloc/agenda/agenda_event.dart';
import 'package:flutter_app/Bloc/agenda/agenda_state.dart';
import 'package:flutter_app/Configs/theme.dart';
import 'package:flutter_app/Models/model_agenda.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


class DayWiseScreen extends StatefulWidget{
  String? title,attendanceDay;
  DayWiseScreen({Key? key,@required this.title,@required this.attendanceDay}):super(key: key);

  _DayWiseState createState()=>_DayWiseState();
}

class _DayWiseState extends State<DayWiseScreen>{
  bool _customTileExpanded = false;
  AgendaBloc? agendaBloc;
  List<AgendaModel> agendaList=[];
  bool flagNoDataAvailable=false;
  String? dayString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    agendaBloc=BlocProvider.of<AgendaBloc>(context);
    agendaBloc!.add(OnLoadingAgendaList(agendaDay: widget.attendanceDay!));
    getDayString();
  }
  getDayString(){
    setState(() {
      if(widget.attendanceDay=="1"){
        dayString="23 Sept";
      }else if(widget.attendanceDay=="2"){
        dayString="24 Sept";

      }else{
        dayString="25 Sept";
      }
    });
  }

  Widget getAgendaList(List<AgendaModel> agendaList,int index){
    if(agendaList.length<=0){
      return ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child:
            Shimmer.fromColors(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 180,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Container(
                          height: 10,
                          width: 150,
                          color: Colors.white,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              baseColor: Theme.of(context).hoverColor,
              highlightColor: Theme.of(context).highlightColor,
            ),
          );
        },
        itemCount: 6,
      );
    }
    return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
                  child:
                  ListTileTheme(
                      dense: true,
                      child:
                      ExpansionTile(
                        title:
                        SizedBox(
                          height:25.0,
                          child: Row(
                              children: [
                                Text(agendaList[index].startTime!,style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 14.0,
                                    color: Colors.black
                                ),),
                                SizedBox(width: 15.0,),
                                Text(agendaList[index].endTime.toString(),style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter-Regular',
                                    fontSize: 14.0,
                                    color: Colors.black
                                ),),
                                SizedBox(width: 15.0,),
                                Text(agendaList[index].activity!.toString(),style: TextStyle(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //venue
                                Row(
                                  children: [
                                    Text("Venue: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                                    Text(agendaList[index].venue!.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                //spoc
                                Row(
                                  children: [
                                    Text("SPOC: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                                    Text(agendaList[index].spocName!.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                                  ],
                                ),
                                SizedBox(height: 5.0,),

                                //contact
                                Row(
                                  children: [
                                    Text("Contact: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontFamily: 'Inter-SemiBold',color: AppTheme.textColor),),
                                    Text(agendaList[index].contact!.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Inter-Regular',color: AppTheme.textColor),),
                                  ],
                                ),
                                SizedBox(height: 5.0,),

                                Align(alignment: Alignment.bottomLeft,child:  Text(
                                  agendaList[index].description!.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontWeight: FontWeight.w400,color: AppTheme.textColor,fontSize: 12.0),

                                )),
                              ],
                            )

                          )
                        ],
                      ))
              )


            ],),
          );

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
      // backgroundColor: AppTheme.appColor,
      ),
      body:SafeArea(child:
      BlocBuilder<AgendaBloc,AgendaState>(builder: (context,agenda){
          return BlocListener<AgendaBloc,AgendaState>(listener: (context,state){
            if(state is AgendaSuccess){
              flagNoDataAvailable=false;

              agendaList=state.agendaList!;
            }
            if(state is AgendaFail){
              flagNoDataAvailable=true;
            }

            if(state is AgendaListLoading){
              flagNoDataAvailable=false;
            }

          },
          child: Container(
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
                  child: Text(dayString.toString(),style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter-Bold',
                      fontSize: 20.0,
                      color: AppTheme.dayColor
                  ),),
                ),
                SizedBox(height: 15.0,),


                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //start
                          Text("Start".toString(),

                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter-Bold',
                                fontSize: 16.0,

                                color: Colors.black
                            ),),
                          SizedBox(width: 47.0,),
                          //end
                          Text("End".toString(),style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter-Bold',
                              fontSize: 16.0,
                              color: Colors.black
                          ),),
                          SizedBox(width: 48.0,),
                          //activity
                          Text("Activity".toString(),style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter-Bold',
                              fontSize: 16.0,
                              color: Colors.black
                          ),),

                        ],),
                    ),
                flagNoDataAvailable==false
                    ?
                    Expanded(
                        child:ListView.builder(
                            itemCount: agendaList.length>0?agendaList!.length:6,
                            itemBuilder: (context,index){
                              return getAgendaList(agendaList,index);
                            })
                    )

                   :
               Container(
                 margin: EdgeInsets.only(top:150.0),
                 child: Align(
                   alignment: Alignment.center,
                     child:Text("No Data Available",textAlign:TextAlign.center,
                   style: TextStyle(fontFamily: 'Inter-Bold',fontSize:25.0,fontWeight: FontWeight.w600,color: AppTheme.textColor),)),
               ),

              ],),
          ),
          );
      },))

    );
  }

}