import 'package:flutter/material.dart';


class MyHeaderDrawer extends StatefulWidget {
  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:  EdgeInsets.only(
              top: 10,
            ),
            width: 85,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/profile.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text("Rural Vistaar", style: TextStyle(color: Colors.white, fontSize: 18,),),
          Text("Info@ruralvistaar", style: TextStyle(color: Colors.blue[700], fontSize: 28,),),
        ],
      ),
    );
  }
}
