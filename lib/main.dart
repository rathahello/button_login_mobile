import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Appcheckbox());

class Appcheckbox extends StatefulWidget {
  @override
  _AppcheckboxState createState() => _AppcheckboxState();
}

class _AppcheckboxState extends State<Appcheckbox> {

  bool _checkText = false;
  void change(bool value) {
    setState(() {
      _checkText = value;
    });
  }

  String _username = "";
  void getName(String name) {
    setState(() {
      _username = name;
    });
  }

  String _password = "";
  void getPassword(String password) {
    setState(() {
      _password = password;
    });
  }

  String _result = "";
  void displayInfo() {
    setState(() {
      if(_checkText){
    _result = "@username: " + _username + " @password: " + _password;
      }else{
        _result = "you are not yet agree..";
      }

      if(_username == "" || _password == ""){
        _result = "Please input your username and password!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Username",
                  ),
                  onChanged: getName, 
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  onChanged:  getPassword,
                ),
              ),
              
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 50.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: _checkText,
                        onChanged: (bool value) {
                          change(value);
                        },
                      ),
                      Text("Are you agree?"),
                    ],
                  ),
                ),
              ),
// login button
              Container(
                width: 300.0,
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: displayInfo,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.blue,
                ),
              ),
// result button
              Container(
                width: 300.0,
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "${_result}",
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
