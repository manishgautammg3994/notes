import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



 class SettingsPage extends StatefulWidget {

   @override
   State<SettingsPage> createState() => _SettingsPageState();
 }

 class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3){
    setState(() {
      valNotify3 = newValue3;
    });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         leading: IconButton(
             onPressed: () {},
              icon: Icon(
             Icons.arrow_back,
             color: Colors.white,
           )
         ),
       ),
       body: Container(
         padding: EdgeInsets.all(10),
         child: ListView(
           children: [
             SizedBox(height:400),
               Row(
                 children: [
                   Icon(
                     Icons.person,
                     color: Colors.blue,
                   ),
                   SizedBox(width: 10),
                   Text("Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                 ],
               ),
             Divider(height: 20, thickness: 1,),
             SizedBox(height: 10,),
              buildAccountOption(context, 'Change Password'),
             buildAccountOption(context, 'Content Settings'),
             buildAccountOption(context, 'Social'),
             buildAccountOption(context, 'Language'),
             buildAccountOption(context, 'Privacy and Security'),
             SizedBox(height: 40),
             Row(
               children: [
                 Icon(Icons.volume_up_outlined, color: Colors.blue),
                 SizedBox(width: 10),
                 Text('Notification', style: TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                 ),),

               ],
             ),
             Divider(height: 20, thickness: 1),
             SizedBox(height: 10),
             buildNotificationOption('Theme Dark', valNotify1, onChangeFunction1),
             buildNotificationOption('Account Active', valNotify2, onChangeFunction2),
             buildNotificationOption('Opportunity', valNotify3, onChangeFunction3),
             SizedBox(height: 50),
             Center(
               child: OutlinedButton(
                 style: OutlinedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(horizontal: 40),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                 ),
                 onPressed: (){},
                 child: Text('SIGN OUT', style: TextStyle(
                   fontSize: 16,
                   letterSpacing: 2.2,
                   color: Colors.black,
                 ),),

               ),
             ),
           ],
         ),
       ),
     );
   }

   Padding buildNotificationOption(String tilte, bool value, Function onChangeMethod){
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(tilte, style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500,
           ),),
           Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
           ),
         ],
       ),
     );
 }

   GestureDetector buildAccountOption(BuildContext context, String title){
     return GestureDetector(
       onTap: (){
         showDialog(context: context, builder: (BuildContext context){
           return AlertDialog(
             title: Text(title),
             content: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text('Option'),
               Text("Option"),
             ],
             ),
             actions: [
               TextButton(
                   onPressed: (){
                     Navigator.of(context).pop();
                   },
                 child: Text('Closed'),
               ),
             ],
           );
         });
       },
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20,),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(title,style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.w500,
               color: Colors.grey,
             )),
             Icon(Icons.arrow_forward_ios, color: Colors.grey),
           ],
         ),
       ),
     );
   }
 }





