import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
final todoList = ToDo.todoList();
List<ToDo>_foundtodo=[];
final _todocontroller=TextEditingController();
@override
  void initState() {
    _foundtodo=todoList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Center(
          child: Text("ToDo List",
          style: TextStyle(
              color: Colors.black,
          ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17,vertical: 20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    onChanged: (value)=>runfilter(value),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20,bottom: 20),
                        child: Text('All ToDos',style: TextStyle(fontSize: 30,fontWeight:FontWeight.w500 ),),
                      ),
                      for(ToDo todo in _foundtodo.reversed)
                      todoitems(toDo: todo,
                      onToDoChanged:_handleTODOChange,
                        ondeleteitem: deletetodoitem,
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(margin: EdgeInsets.only(
                    bottom: 5,
                    right: 20,
                    top: 610,
                    left: 20,
                  ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,

                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: InputDecoration(
                        hintText: 'Add a new item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              Container(
                margin: EdgeInsets.only(
                    top: 610,
                    bottom: 0,
                    right: 20
                ),
                child: ElevatedButton(
                  child: Text('+',style: TextStyle(fontSize: 40),),
                  onPressed: () {
                    _addtodoitem(_todocontroller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(40,40),
                    elevation: 10,
                  ),
                ) ,
              ),
            ]),
          ),
        ],
      ),
    );
  }
  void _handleTODOChange(ToDo toDo){
    setState(() {
      toDo.isDone=!toDo.isDone;
    });
  }
  void deletetodoitem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id==id);
    });
  }
  void _addtodoitem(String todo){
    setState(() {
      todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo));
    });
    _todocontroller.clear();
  }
  void runfilter(String enterword){
  List<ToDo> results=[];
  if(enterword.isEmpty){
    results=todoList;
  }
  else{
    results=todoList.where((item) => item.todoText!.toLowerCase().contains(enterword.toLowerCase())).toList();
  }
  setState(() {
    _foundtodo=results;
  });
  }
}
