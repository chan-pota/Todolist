
import 'package:flutter/material.dart';

// for send request to api
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:todolist/pages/todolist.dart';

class UpdatePage extends StatefulWidget {
  //const UpdatePage({super.key});
  final v1, v2, v3;
  const UpdatePage(this.v1, this.v2, this.v3);

  @override
  State<UpdatePage> createState() => _UpdatePage();
}

class _UpdatePage extends State<UpdatePage> {

 var _v1, _v2, _v3;

TextEditingController todo_title = TextEditingController();
 TextEditingController todo_detail = TextEditingController();

 void initState(){
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    todo_title.text = _v2;
    todo_detail.text = _v3;
 }
 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: new IconButton(icon: new Icon(Icons.arrow_back),
        //       onPressed: (){
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Todolist()));
        //           // Navigator.pop(context);
        //       },
        //     ), 
        title: Text('Edit to do list'),
        actions: [IconButton(onPressed: (){
                var status = deleteTodo(_v1);
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Todolist()));
                
                Navigator.pop(context, status);
        }, icon: Icon(Icons.delete))],),
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

            SizedBox(height: 15),
            Column(children: [
              ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 60, 124, 235),
              textStyle: const TextStyle(fontSize: 15),
              minimumSize: Size(150, 30)
              ), 
            onPressed: (){

                
                
                setState(() { // สำหรับ refresh page
                  updateTodo(todo_title, todo_detail).then((value){ // ถ้าต้องการผลลัทธ์จากการคืนค่าเราต้องใช้ then
                      String msg = "";
                      if(value == "success"){
                          msg = "Update complete";
                      }else{
                          msg = "fail to update";
                      }
                      final snackbar = SnackBar(
                        content: Text("${msg}"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);

                      // todo_title.clear();
                      // todo_detail.clear();
                      
                  },);
                  
                });
                 
              }, child: Text("บันทึก")
            )
            
            ],) 
              
            
            
        ],
      )
    );
  }

  Future updateTodo(todo_title, todo_detail) async{ // ใส่ใน class เพื่อจะให้เรียกตัวแปรมาจาก class
      var url = Uri.http('192.168.31.83:8000','/api/update-todolist/${_v1}');
      Map<String, String> header = {"Content-type":"application/json"};
      String jsondata = '{"title":"${todo_title.text}","detail":"${todo_detail.text}"}';
      //String jsondata = '{"title":"Give food to monks","detail":"Give some food to monks"}';
      var response = await http.put(url, headers: header, body: jsondata);
      //var data = jsonDecode(response.body.toString());
      
      if(response.statusCode == 201) {
          print("success");
          return "success";
      }else{
          return "fail";
      }

  }

  Future deleteTodo(_v1) async{ // ใส่ใน class เพื่อจะให้เรียกตัวแปรมาจาก class
      var url = Uri.http('192.168.31.83:8000','/api/delete-todolist/${_v1}');
      Map<String, String> header = {"Content-type":"application/json"};
      //String jsondata = '{"title":"${todo_title.text}","detail":"${todo_detail.text}"}';
      String jsondata = '{"data":""}';
      //String jsondata = '{"title":"Give food to monks","detail":"Give some food to monks"}';
      var response = await http.delete(url, headers: header, body: jsondata);
      // http.delete does not support body
      if(response.statusCode == 204) {
          return "success";
      }else{
          return "fail";
      }
      
  }


}