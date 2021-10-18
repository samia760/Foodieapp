/*import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Screen 4")),
    );
  }
}*/
//import 'dart:html';
//import 'dart:js';
import 'dart:io';
import 'dart:ui';
//import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'screen1.dart';
//import 'package:foodieapp/home.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  
   final _firstnameController =TextEditingController();

  final _lastnameController =TextEditingController();

  final _emailController =TextEditingController();

  final _passController =TextEditingController();

    GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();

   //late File image;

   /*Future<void> getImage()async{
          PickedFile pickedFile=(await ImagePicker().getImage(source: ImageSource.gallery));
              image=File(pickedFile.path);
   }*/
  File? _image;
//Future<void>
 getImage()async{
final image= await ImagePicker().pickImage(source: ImageSource.gallery);
 setState(() {
  _image=File(image!.path);
});
}

Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return TextFormField(
      controller: controller,
      
      obscureText: obscureText,
       decoration: InputDecoration(
         
         hintText: hintText,
         hintStyle: TextStyle(color: Colors.black),
         enabledBorder: UnderlineInputBorder(
           borderSide: BorderSide(color: Colors.black)
         )
       ),
     );    
}

  @override
  Widget build(BuildContext context) {
    return 
  Scaffold(
   resizeToAvoidBottomInset:false,
   appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Screen1(title: 'FOODIE'),
           ),
         );
        },
        ),
   centerTitle: true,
        backgroundColor: Colors.red[900],
        //Theme.of(context).redcolor,
        title: Text("Profile",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
         
          Padding(
            padding: const EdgeInsets.only(top: 15,right: 10),
            child: Text("Edit",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold) ,),
          )
         ],
    ),

    body:Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              
              Container(
                height: 140,
                width: double.infinity,
                color: Colors.red[900],
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children: [
                 CircleAvatar(
                   maxRadius: 65,
                   backgroundColor: Colors.white,
                   child: CircleAvatar(
                     maxRadius: 60,
                  child:_image==null? Image.network('https://themefam.com/wp-content/uploads/2019/09/no-image-baby.png') 
                  :Image.file(_image!),
                   //backgroundImage:NetworkImage('https://themefam.com/wp-content/uploads/2019/09/no-image-baby.png'),
                   ),
                 )
                  ],
                ),
              ),
              Expanded(
                
              child: SingleChildScrollView(
                child: Container(
                  width: 330,
                  
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  color: Colors.white,
                  child: Column(
                    
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       textfield(hintText: "FullName",
                           controller: _firstnameController,
                           
                           obscureText: false,
                         //  controller:firstname 
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           textfield(hintText: "Address",
                           controller: _lastnameController,
                           obscureText: false,
                         //  controller: lastname
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           textfield(hintText: "Email",
                           controller: _emailController,
                           obscureText: false,
                          // controller: email
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           textfield(hintText: "Password",
                           controller: _passController,
                           obscureText: true,
                          // controller: password
                           ),
                   
                  Container(
                     margin: EdgeInsets.only(top:10),
                       width: 160,
                       height: 50,
                  child:  RaisedButton(
                         splashColor: Colors.red,
                       elevation: 7,
                         color: Colors.red[900],
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                           side: BorderSide(color: Colors.red,width: 2),
                           
                           ), onPressed: () {  },
                           child: Text("Update",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,shadows: [
                          Shadow(
                  blurRadius: 13.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  ),
                     ]),),
                    )
                  )
                    ],
                  ),
                ),
              ))
            ],
          ),
              Positioned(
                top: 100,
                left: 200,
            child: CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.white,
              child: IconButton(onPressed:(){
                getImage();
              }, icon: Icon(Icons.edit,color: Colors.black,))
            ),
          )
        ],
      ),
    ),
  );
  }} 
