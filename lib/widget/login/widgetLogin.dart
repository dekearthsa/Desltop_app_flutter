import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../../main.dart';

class WidgetLogin extends StatefulWidget {
  @override
  SetWidgetLogin createState() => SetWidgetLogin();
}

class SetWidgetLogin extends State<WidgetLogin> {
  // final formKeyUsername = GlobalKey<FormState>();
  // final formKeyPassword = GlobalKey<FormState>();
  // final _fromKey = GlobalKey<FormState>();
  final LocalStorage storage = new LocalStorage('localstorage_app');

  String username = "";
  String password = "";
  String invalidLOgin = "";



  void _haddleLogin() async {
    // print("username =>" + username);
    // print("password =>" + password);
    if(username == "admin" || password == "1234"){
      try {
        await storage.setItem("username_flutter", username);
        await storage.setItem("password_flutter", password);
        // Navigator.pushNamed(context, 'home');
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter desktop app.'),));
      print("storage created.");
      } catch (e) { 
        print(e);
      }
    }else{
      // print("invalid");
      setState(() {
        invalidLOgin = "Invalid username or password";
        
      });
      print(invalidLOgin);
    }
  }



  Future _haddleDebug() async {
    final isUsername = await storage.getItem("username_flutter");
    final isPassword = await storage.getItem("password_flutter");
    print("isUsername => " + isUsername);
    print("isPassword => " + isPassword);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 110.0),
                  child: Form(
                    // key: formKeyUsername,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Username"),
                      initialValue: "",
                      onChanged: ((value) => setState(() {
                            username = value!;
                          })),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Form(
                    // key: formKeyPassword,
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Password"),
                      initialValue: "",
                      onChanged: ((value) => setState(() {
                            password = value!;
                          })),
                    ),
                  ),
                ),
              ],
            )),

            Container(  
              margin: EdgeInsets.only(top: 20.0),
              child: invalidLOgin != ""? 
              Container(
                child: Container(
                  child: Text(invalidLOgin, style: TextStyle(color: Colors.red[900]),),
                ),
              ): 
              Container(
                child: Text(""),
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[50]
                ),
                child: Text("Login", style: TextStyle(color: Colors.blueGrey[700])),
                onPressed: () {
                  _haddleLogin();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[50]
                ),
                child: Text("Debug", style: TextStyle(color: Colors.blueGrey[700])),
                onPressed: () {
                  // if(formKeyUsername.currentState!.validate() && formKeyPassword.currentState!.validate()){
                  //   formKeyUsername.currentState!.save();
                  //   formKeyPassword.currentState!.save();
                  //   haddleLogin();
                  // }
                  _haddleDebug();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
