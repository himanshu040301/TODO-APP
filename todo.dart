import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_.dart';

class todoitems extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final ondeleteitem;
  const todoitems ({Key? key,required this.toDo,required this.ondeleteitem,required this.onToDoChanged,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () {
          onToDoChanged(toDo);
          // print('clicked');
        },
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5) ,
        tileColor:Colors.white,
        leading: Icon(
          toDo.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: Colors.blue,),
        title: Text(toDo.todoText!,
          style: TextStyle(fontSize:15,
        color: Colors.black,
        decoration: toDo.isDone?TextDecoration.lineThrough:null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical:12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              ondeleteitem(toDo.id);
              // print('clicked on delete');
            } ,
          ),
        ),
      ),
    );
  }
}
