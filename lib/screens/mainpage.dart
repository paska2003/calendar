import 'package:calendar/utils/config.dart';
import 'package:flutter/material.dart';

import 'day.dart';

class MainPage extends StatefulWidget {
  static const String id = "mainpage";


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int chosen = 1;
  int? chosenMonthIndex;
  int? dopChosenMonthIndex;
  List daysM=[];
  List daysFirst=[];
  List daysFirstFinal=[];
  List finalListOfDays=[];
  List daysLastList=[];
  int? daysLast;
  String? chosenM;
  void initState() {
    super.initState();

    chosenMonthIndex= chosen-1;

    addLastDaysFirst();

    listDays();
    addLastDaysLast();
    finallist();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Календарь",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Roboto',
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,


        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
                 child: ListView.builder(
                     itemCount: calendarInfo.length,
                     scrollDirection: Axis.horizontal,
                     itemBuilder: (BuildContext contex, int index){
                       return GestureDetector(
                         onTap: (){
                           setState(() {
                             chosen = int.parse(calendarInfo[index]['id']);
                             chosenM= calendarInfo[index]['title'];
                             chosenMonthIndex= chosen-1;
                             daysM.clear();
                             daysFirst.clear();
                             daysFirstFinal.clear();
                             finalListOfDays.clear();
                             daysLastList.clear();
                             addLastDaysFirst();

                             listDays();
                             addLastDaysLast();
                             finallist();

                           });
                           print("chosen=$chosen");
                           print("chosenMonthIndex=$chosenMonthIndex");
                           print("finalListOfDays=$finalListOfDays");


                           },
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: MediaQuery.of(context).size.height * 0.06,
                             width: MediaQuery.of(context).size.width * 0.2,
                             decoration: BoxDecoration(
                               // color: Colors.greenAccent,
                               color: chosen == int.parse(calendarInfo[index]['id']) ? Colors.orange.shade800 : Colors.orange.withOpacity(0.2),
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(20.0)
                                 )
                             ),
                             child: Center(
                               child: Text(calendarInfo[index]['title']
                               ),
                             ),
                           ),
                         ),
                       );
                     }


    ),
               ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                  itemCount: days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext contex, int index){
                    return GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                              )
                          ),
                          child: Center(
                            child: Text(days[index]['title']
                            ),
                          ),
                        ),
                      ),
                    );
                  }


              ),
            ),
            Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.7,
              child: GridView.builder(
                itemCount: finalListOfDays.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7
                ),
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {

                    caliddarDay(){
                      if(finalListOfDays[index]["tipe"]=='main'){
                        return GestureDetector(
                          onTap: (){
                            print(finalListOfDays[index]['title'].toString());
                            print("chosenM=$chosenM");
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Day(month: chosen,day:finalListOfDays[index]['title'].toString() )));
                          },
                          child: Text(finalListOfDays[index]['title'].toString(),
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,

                                color: Colors.black
                            ),),
                        );
                      }
                      else {
                        return Text(finalListOfDays[index]['title'].toString(),
                          style: TextStyle(
                              fontSize: 11.0,

                              color: Colors.white
                          ),);

                      }
                    }
                    print("finalListOfDays[index] - ${finalListOfDays[index]}");

                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(


                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.all(
                              Radius.circular(40.0)
                          )
                      ),
                      child: Center(
                          child: caliddarDay()
                        // child: Text(finalListOfDays[index]['title'].toString()),
                      ),
                    ),
                  );
                  }
              )
            ),
             ],
           ),

    )
    );
  }
  addLastDaysFirst(){
    print('addLostdaysFirst=${calendarInfo[chosenMonthIndex!]["dop"]}');
    dopChosenMonthIndex = chosenMonthIndex! - 1 ;
    if(dopChosenMonthIndex! < 0){
      dopChosenMonthIndex=11;

    }else if (dopChosenMonthIndex! < 11){
      dopChosenMonthIndex=0;

    }
    print("dopChosenMonthIndex=$dopChosenMonthIndex");

    for ( int i = 0; i < int.parse(calendarInfo[chosenMonthIndex!]["dop"]); i++) {
      print("ostatok=${int.parse(calendarInfo[chosenMonthIndex!]["info"])-i}");
      daysFirst.add({"title":int.parse(calendarInfo[chosenMonthIndex!]["info"])-i});
      print("daysFirst=$daysFirst");}
    daysFirstFinal.addAll(daysFirst.reversed.toList());
    print("daysFirstFinal=$daysFirstFinal");



  }
  addLastDaysLast(){
    if(chosen== 5 ){
    daysLast= 42 -(daysM.length + daysFirstFinal.length);
    print("daysLast=$daysLast");
    for ( int i = 1; i < daysLast!+1; i++){
      print(i);
      daysLastList.add({"title":i});
      print("daysLastList=$daysLastList");

    }}
    else if (chosen== 8 ){
      daysLast= 42 -(daysM.length + daysFirstFinal.length);
      print("daysLast=$daysLast");
      for ( int i = 1; i < daysLast!+1; i++){
        print(i);
        daysLastList.add({"title":i});
        print("daysLastList=$daysLastList");

      }}else {{
      daysLast= 35 -(daysM.length + daysFirstFinal.length);
      print("daysLast=$daysLast");
      for ( int i = 1; i < daysLast!+1; i++){
        print(i);
        daysLastList.add({"title":i});
        print("daysLastList=$daysLastList");

      }}

    }

  }



  listDays(){
    if(daysM.length==0){

    for ( int i = 1; i < int.parse(calendarInfo[chosenMonthIndex!]["info"])+1; i++) {

    daysM.add({"title":i,"tipe":"main"});
    print("days=$daysM");}

  }
  }
  finallist(){
    if(42 -(daysM.length + daysFirstFinal.length) == 0){
      finalListOfDays.addAll(daysFirstFinal);
      finalListOfDays.addAll(daysM);
      print("finalListOfDays=$finalListOfDays");

    }else if(42 -(daysM.length + daysFirstFinal.length) > 0){
      finalListOfDays.addAll(daysFirstFinal);
      finalListOfDays.addAll(daysM);
      finalListOfDays.addAll(daysLastList);
      print("finalListOfDays=$finalListOfDays");

    }
  }


}
