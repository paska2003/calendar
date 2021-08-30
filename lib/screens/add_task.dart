import 'package:calendar/utils/database.dart';
import 'package:calendar/utils/task_model.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  static const String id = "addtask";
  final  month,day;

  AddTask({@required this.month,this.day,});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String? taskDescription;
  String? selectedTime= "30 минут";
  RangeValues values = RangeValues(50, 300);
  _sendTask(){
    Task task= Task(
        description:taskDescription,
        day: "${widget.day}.${widget.month}",
        time: selectedTime);
   DatabaseTask.instance.insertTask(task);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title:Text("Добовление задачи ",
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5.0,top: 20.0),
              alignment: Alignment.centerLeft,
              child: Text("Описание",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    color: Colors.black
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 5.0,right: 5.0),
              child: Container(
                // height:  MediaQuery.of(context).size.height *0.09,


                child: Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Center(
                        child: TextFormField(
                          initialValue: taskDescription,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Roboto',
                              color: Colors.black
                          ),

                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),

                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              // labelText: ("ФИО"),

                              hintText: 'описание задачи',
                              hintStyle: TextStyle(
                                  fontSize: 20.0,

                                  color: Colors.grey

                              ),
                              labelStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold

                              )
                          ),
                          onChanged: (taskDescription)=> setState(() => this.taskDescription = taskDescription),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                child:Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 10.0,top: 15.0),
                  child: GestureDetector(

                    onTap: () => _onButtonPressed(),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 2,


                          ),

                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$selectedTime",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.grey
                                ),
                              ),
                              Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orange,
                                  size: 20.0
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ),
                ),
                ),
            GestureDetector(

                onTap: () async {
                  print('Сохранить');
                  print("задача = $taskDescription");
                  print("Время=$selectedTime");
                  print("дата=${widget.day}.${widget.month}");
                  _sendTask();





                },

                child: Container(

                  height:  MediaQuery.of(context).size.height *0.08,
                  width: MediaQuery.of(context).size.width *0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.transparent
                      ),

                      child: Center(
                        child: Text("Сохранить",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20.0,
                              color: Colors.orange
                          ),),
                      ),
                    ),
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
  void _onButtonPressed(){
    print('test');
    showModalBottomSheet(context: context, builder: (context) {

      return Container(
        height: 600,
        child:ListView(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="1 час";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("1 час",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="1 час 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("1 час 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="2 час ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("2 час ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="2 часа 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("2 часа 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="3 часа ";
                });
                selectedTime="3 часа ";
                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("3 часа ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="3 часа 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("3 часа 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="4 часа";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("4 часа ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="4 часа 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("4 часа 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="5 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("5 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="5 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("5 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="6 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("6 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="6 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("6 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="7 часов";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("7 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="7 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("7 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="8 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("8 часов",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="8 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("8 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="9 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("9 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="9 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("9 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="10 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("10 часов",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="10 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("10 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="11 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("11 часов",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="11 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("11 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="12 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("12 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){ setState(() {
                selectedTime="12 часов 30 минут";
              });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("12 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="13 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("13 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="13 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("13 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="14 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("14 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="14 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("14 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="15 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("15 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="15 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("15 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="16 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("16 часов",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="16 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("16 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="17 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("17 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="17 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("17 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="18 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("18 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="18 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("18 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="19 часов";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("19 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="19 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("19 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="20 часов ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("20 часов ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="20 часов 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("20 часов 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){ setState(() {
                selectedTime="21 час ";
              });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("21 час ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){ setState(() {
                selectedTime="21 час 30 минут";
              });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("21 час 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="22 часа ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("22 часа ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="22 часа 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("22 часа 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="23 часа ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("23 часа ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="23 часа 30 минут";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("23 часа 30 минут",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedTime="24 часа ";
                });

                Navigator.of(context).pop();



              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                child: Container(
                  height:  MediaQuery.of(context).size.height *0.09,
                  width: MediaQuery.of(context).size.width *0.3,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: Center(
                          child: Text("24 часа ",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        )




      );

    },
      isScrollControlled: true,

    );
  }
}
