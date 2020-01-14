
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List users; // create array 
  Map userData;

  // step 2
  Future setUser() async {
    String url ="https://reqres.in/api/users";
    http.Response response = await http.get(url);
    userData = json.decode(response.body);
// step 3 with create array
    setState(() { 
     users = userData["data"];
    });
    debugPrint(response.body);
  }

  // to do call function setUser();
  @override
  void initState() {
    setUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int i){
          // final storeUser = users[i];
          return Card(
            child: Container(
               padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage("${users[i]["avatar"]}"),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text("${users[i]["first_name"]}", style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}