import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';



class BtnLogout extends StatefulWidget{
  @override
  SetBtnLogout createState() => SetBtnLogout();
}

class SetBtnLogout extends State<BtnLogout> {

  final LocalStorage storage = new LocalStorage('localstorage_app');

  void _haddleLogout ()  {
    setState(()async {
          await storage.deleteItem("username_flutter");
          await storage.deleteItem("password_flutter");
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return (Container(

      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: (()  {
                Navigator.pushNamed(context, 'login');
              }),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  )),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
