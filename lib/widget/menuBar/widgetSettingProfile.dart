import 'package:flutter/material.dart';

class BtnSettingProfile extends StatelessWidget {
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
              onPressed: (() => {}),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
                  Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "SETTING",
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
