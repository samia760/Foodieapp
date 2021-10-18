// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodieapp/forgotpass.dart';
import 'package:foodieapp/home.dart';

import 'screen1.dart';

class Login extends StatelessWidget {
  static String pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final _emailController =TextEditingController();
  final _passController =TextEditingController();
  RegExp regExp = RegExp(Login.pattern);
    GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  Future<FirebaseUser?> login(String email,String pass) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
  AuthResult result =await _auth.signInWithEmailAndPassword(email: _emailController.text ,password: _passController.text);
  FirebaseUser user=result.user;
  
  return user;
}catch(e){
  print(e);
  return null;
}
  }
  //validation

void validation(){


if(_passController.text.trim().isEmpty || _passController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "password is empty"
    ))
  );
  return;
}
else if(!regExp.hasMatch(_emailController.text)){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: 
    Text(
      "Please enter valid email"
    ))
  );
  return;
}
  
//end
}
  Widget textfield({required String hintText,required IconData icon,required Color iconColor,required bool obscureText,required TextEditingController controller}){
   return Column(
             children: [
               TextFormField(
                //  maxLengthEnforced: false,
           // maxLines: null,
             controller: controller,
      obscureText: obscureText,
                  decoration: InputDecoration(
                    hintText:hintText,
                    prefixIcon: Icon(icon,color:Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder:UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
               )
             ],
           ) ;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      key:globalKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
       
        child: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
      
     children:[
       
     Padding(
       padding: const EdgeInsets.only(top: 26),
       child: Image.asset('assets/images/logo.jpg'),
     ),
      Padding(
        padding: const EdgeInsets.only(top:30,bottom:30 ),
        child: Text("Welcome To Foodie",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,
           shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.grey,
                    offset: Offset(5.0, 5.0),
                    ),
                ]
               )),
      ),
     /* body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container(
            child: Center(
             child: Image.asset('assets/images/logo.jpg'),


            ),
          )
          ),
          Expanded(child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("Welcome To Foodie",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,
         shadows: [
              Shadow(
                  blurRadius: 10.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  ),
              ]
             )),*/

             /*Column(
               key: _formKey,
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Enter your username'
  ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;

              },
            
            ),
          ]
             ),*/
             //hy
                     
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
           textfield(
             // controller: _emailController,
              obscureText: false,
              controller: _emailController,
             hintText:"Email",
             icon:Icons.person_outline, 
             iconColor: Colors.black,
           ),
           SizedBox(height: 30,),
           textfield(
             obscureText: true,
             controller: _passController,
              
             hintText:"Password",
            icon:Icons.lock_outline,
             iconColor: Colors.black,
           ),
           Row(
            
             children
             : [
               GestureDetector(
                 onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>ForgotPass()
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
                 },
                 child: Padding(
                 padding: const EdgeInsets.only(left: 66),
                 child: Text('forgot Password?',style: TextStyle(color: Colors.red),),
               ))
             ],
           )
    
         ],
     ),
     
      Container(
       margin: EdgeInsets.only(top:26,bottom:26),
         width: 160,
         height: 50,
         child: RaisedButton(
           splashColor: Colors.red,
         elevation: 7,
           color: Colors.red[900],
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
             side: BorderSide(color: Colors.red,width: 2),
             
             ),
           
           
           
           onPressed: ()async{
             final email=_emailController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             FirebaseUser? user = await login(email, pass);
             
             if(user !=null){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>Screen1(title: 'FOODIE',)//firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));

             }else{
              validation();
             }

             
           },
           child: Text("Login",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,shadows: [
            Shadow(
                blurRadius: 13.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
       ]),),
     )
     ),
     Row(
         mainAxisAlignment: MainAxisAlignment.center,
         
         children: [
           Text("New User?",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight:FontWeight.bold),),
           Text("Register Now",style: TextStyle(fontSize: 15,color: Colors.red,fontWeight:FontWeight.bold),)
         ],
     )

           ]

          )
          ) 
          )
        
        
       
    );
      
  
    
  }
}