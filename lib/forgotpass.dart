import 'package:flutter/material.dart';
import 'package:foodieapp/login.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({ Key? key }) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30,
      
       onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Login()
           ),
         );
        },
        ),

       
         centerTitle: true,
        backgroundColor: Colors.red[900],
        //Theme.of(context).redcolor,
        title: Text("Forgot Pass",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
       
     ),
     
    );
  }
}