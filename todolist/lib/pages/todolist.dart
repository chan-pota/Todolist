import 'package:flutter/material.dart';
import 'package:todolist/pages/add.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:todolist/pages/update.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {

  List todolistitems = [];

  _getUpdate () async{
    setState(() {
      getTodolist();
    });
  }


  @override
  void initState(){
    super.initState();
    getTodolist();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Addpage())).then((value){
              setState(() {
                getTodolist();
              });
            });
      },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('all to dolist',),
      actions: [IconButton(onPressed: (){
          setState(() {
            getTodolist();
          });
      }, icon: Icon(Icons.refresh, color: Colors.white))],
      
      ),
      body: todolistCreate()
    );
  }

  Widget todolistCreate(){
    return ListView.builder(
      itemCount: todolistitems.length,
      itemBuilder: (context, int index){
      var data = todolistitems[index]["title"];
      return Card (child: ListTile(
          
          title: Text(data),
          onTap: (){
            var id = todolistitems[index]['id'];
            var title = todolistitems[index]['title'];
            var detail = todolistitems[index]['detail'];
            Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdatePage(id,title,detail))).then((value){
              setState(() {
                String msg = "";
                if(value == "success"){
                   msg = "complete remove data";
                }else{
                   msg = "fail to remove data";
                }

                final snackbar = SnackBar(
                    content: Text("${msg}"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                getTodolist();
                
              });
            });
          },));
    });
  }

  Future<void> getTodolist() async{
    List alltodo = [];
    var url = Uri.http('192.168.31.83:8000','/api/all-todolist');
    var response = await http.get(url);
    // var response = await http.get(url, headers: {
    //   'Content-Type':'application/json; charset=UTF-8',
    //   'Accept' : 'application/json'
    // });
    //var result = json.decode(utf8.decode(response.bodyBytes));
    var result = utf8.decode(response.bodyBytes);

    setState(() {
      todolistitems = json.decode(result);
    });
  }

}