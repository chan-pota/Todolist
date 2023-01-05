
import 'package:flutter/material.dart';

// for send request to api
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:todolist/pages/todolist.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
 
 TextEditingController todo_title = TextEditingController();
 TextEditingController todo_detail = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add to do list'),
              // leading: new IconButton(icon: new Icon(Icons.arrow_back),
              // onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=> Todolist()));
              // },
              // ), 
              actions:<Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
      ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            controller: todo_title,
            decoration: InputDecoration(
              labelText: 'ชื่อกิจกรรม',
              border: OutlineInputBorder()
            )),
          SizedBox(height: 10),
          TextField(
            controller: todo_detail,
            keyboardType: TextInputType.multiline,
            minLines: 4,
            maxLines: 8,
            decoration: InputDecoration(
              labelText: 'รายละเอียด',
              border: OutlineInputBorder(),
            )),
            SizedBox(height: 30,),
            Center(child: ConstrainedBox(
               constraints: BoxConstraints.tightFor(width: 150, height: 50),
              child: ElevatedButton(
              onPressed: (){
                postTodo(todo_title, todo_detail);
                setState(() { // สำหรับ refresh page
                  todo_title.clear();
                  todo_detail.clear();
                  
                  
                });
                 
              }, child: Text("บันทึก")
            ),
              
            ),)
            
              
            
            
        ],
      )
    );
  }

  Future postTodo(todo_title, todo_detail) async{ // ใส่ใน class เพื่อจะให้เรียกตัวแปรมาจาก class
      //var url = Uri.https('4cbe-171-99-162-92.ngrok.io','/api/create-todolist');
      var url = Uri.http('192.168.31.83:8000','/api/create-todolist');
      Map<String, String> header = {"Content-type":"application/json"};
      String jsondata = '{"title":"${todo_title.text}","detail":"${todo_detail.text}"}';
      //String jsondata = '{"title":"Give food to monks","detail":"Give some food to monks"}';
      var response = await http.post(url, headers: header, body: jsondata);
      //var data = jsonDecode(response.body.toString());
      print(response.body);
  }


}