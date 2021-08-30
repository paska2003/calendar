import 'package:calendar/utils/database.dart';
import 'package:calendar/utils/task_model.dart';
import 'package:flutter/material.dart';

import 'add_task.dart';

class Day extends StatefulWidget {
  static const String id = "day";
  final  month,day;

  Day({@required this.month,this.day,});




  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  late Future<List<Task>> _taskList;



  @override
  void initState() {
    super.initState();
    _updateTaskList();

  }

  _updateTaskList(){
    _taskList = DatabaseTask.instance.getTaskList();



  }

  // void _filterList(value) {
  //   setState(() {
  //     filteredList = _taskList
  //         .where((text) => text.eng.toLowerCase().contains(value.toLowerCase()))
  //         .toList(); // I don't understand your Word list.
  //   });
  // }


  Widget _bildTask(Task task){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ListTile(
            title: Text(task.description!


            ),
            subtitle: Text(task.time!

            ),
          )
        ],
      ),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title:Text("${widget.day}.${widget.month}.2021",
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
              height: MediaQuery.of(context).size.height * 0.7,
              child: FutureBuilder(
                future: _taskList,
                builder: (context, AsyncSnapshot snapshot){
                var  res =  _taskList.query(
                      "Companies",
                      where: "name LIKE ?",
                      whereArgs: ['%$title']
                  );
                  // List<Map> result =  _taskList.rawQuery("SELECT content FROM table WHERE content LIKE '%${widget.day}.${widget.month}%'");

                  return ListView.builder(
                    itemCount: int.parse(snapshot.data!.length.toString()),
                      itemBuilder: (BuildContext context, int index){


                      if(snapshot.data!.length <1){
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(child: Text("тасков нету ")),
                        );
                      }else {

                        return _bildTask(snapshot.data![index]);
                      } });
                }
              ),
            ),

            Container(
              child:IconButton(

                  icon: Icon(Icons.add,), onPressed: () { print("add");
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTask(month: widget.month,day:widget.day) ));
                  },
                  color: Colors.orange,
                  iconSize: 40,
                ),

            )
          ],
        ),
      ),
    );
  }
}
