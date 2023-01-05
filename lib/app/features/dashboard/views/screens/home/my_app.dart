import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   return Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
            crossAxisCount: 2,
          children: <Widget>[
            MyMenu(title: "Spoke daily Sales", icon: Icons.ios_share,warna: Colors.brown,),
            MyMenu(title: "Spoke registration", icon: Icons.text_fields,warna: Colors.brown,),
            MyMenu(title: "Spoke Visit Plan", icon: Icons.calendar_month,warna: Colors.brown,),
            MyMenu(title: "Add/Visit Outlet", icon: Icons.shopping_cart,warna: Colors.brown,)
          ],
        ),
    );
  }
}
class MyMenu extends StatelessWidget {
  MyMenu({required this.title, required this.icon, required this.warna,});

   @required final String title;
   @required final IconData icon;
   @required final MaterialColor warna;



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){},
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 90,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 10.0))
            ],
          ),
        ),
      ),
    );
  }
}




