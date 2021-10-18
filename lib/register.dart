

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'login.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  static String pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
   final _firstnameController =TextEditingController();
  final _lastnameController =TextEditingController();
  final _emailController =TextEditingController();
  final _passController =TextEditingController();
  RegExp regExp = RegExp(Register.pattern);
    GlobalKey<ScaffoldState> globalKey =GlobalKey<ScaffoldState>();
  
  Future<bool> registerUser(String email,String pass,String firstname,String lastname) async{
FirebaseAuth _auth= FirebaseAuth.instance;
try{
AuthResult result =await _auth.createUserWithEmailAndPassword(email:_emailController.text, password: _passController.text);
  FirebaseUser user=result.user;
  Firestore.instance.collection('userData').document(user.uid).setData(
        { 
          'firstname':_firstnameController.text,
           'lastname':_lastnameController.text,
           'email':_emailController.text,
           'password':_passController.text,
           'userUid':user.uid,
 
        }
    
  );
  //UserAccountsDrawerHeader(accountName: Text(_firstnameController.text), accountEmail: Text(_emailController.text));
  UserUpdateInfo info=UserUpdateInfo();
  info.displayName=firstname;
  info.displayName=lastname;
  info.displayName=email;
  
  user.updateProfile(info);
  return true;
}

/*on catch (e) {
  if (e.code == 'weak-password') {
    globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "The password provided is too weak"
    ),),);
  } else if (e.code == 'email-already-in-use') {
    globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "The account already exists for that email."
    ),),);
    
  } 
  return false;
}*/
catch(e){
  
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      e.toString()
    ),),);
  return false;
}
  }
//validation

void validation(){
if(_firstnameController.text.trim().isEmpty || _firstnameController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "First Name is empty"
    ))
  );
  return;
}
if(_lastnameController.text.trim().isEmpty || _lastnameController.text.trim() == null){
  globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "Last Name is empty"
    ))
  );
  return;
}

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
  
 Widget textfield({required String hintText,required bool obscureText,required TextEditingController controller}){

    return TextFormField(
      controller: controller,
      /*validator: (value){
      if(_firstnameController.text.trim().isEmpty){
     globalKey.currentState!.showSnackBar(
    SnackBar(content: Text(
      "Fields are empty"
    ),),);
      }*/
      

      
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
  Widget buttons({required String buttonname,required Color color,required Color textColor,required Function ontap}){
    return Container(
      
      width: 120,
      //margin: EdgeInsets.only(top:5),
      child: RaisedButton(
        splashColor: Colors.black,
         elevation: 5,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),

        ),
        child: Text(
          buttonname,
          style: TextStyle(fontSize: 20,
          shadows: [
            Shadow(
                blurRadius: 13.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
       ]
          ),
        ),
        onPressed: ()async{
         
        }
      
      
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
     key:globalKey,
      body: SafeArea(child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children:[
     Image.asset('assets/images/logo.jpg'),
      Padding(
        padding: const EdgeInsets.only(top:18,bottom: 10),
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
     Container(
         height: 300,
         
           child: Column(
             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
             
              
             children: [
               textfield(hintText: "Firstname",
               controller: _firstnameController,
               
               obscureText: false,
             //  controller:firstname 
               ),
               textfield(hintText: "Lastname",
               controller: _lastnameController,
               obscureText: false,
             //  controller: lastname
               ),
               textfield(hintText: "Email",
               controller: _emailController,
               obscureText: false,
              // controller: email
               ),
               textfield(hintText: "Password",
               controller: _passController,
               obscureText: true,
              // controller: password
               ),
             ],
           ),
         //check
       
         //ki
           
         
     ),
         /*Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            CircularProgressIndicator(),
           ],
         )*/
         
           Container(
                margin: EdgeInsets.only(top:2,bottom:26),
                  width: 160,
                  height: 40,
                  child: RaisedButton(
           splashColor: Colors.red,
                  elevation: 7,
           color: Colors.red[900],
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
             side: BorderSide(color: Colors.red,width: 2),
             
             ),
           
           
           
           onPressed: ()async{
                 final firstname=_firstnameController.text.toString().trim();
             final lastname=_lastnameController.text.toString().trim();
              final email=_emailController.text.toString().trim();
             final pass=_passController.text.toString().trim();
             bool result = await registerUser( firstname, lastname,email,pass);
             if(result){
               Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=>Login()
                 ));
           
             }else{
               validation();
             }
           
             
           },
           child: Text("Register",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,shadows: [
            Shadow(
                blurRadius: 13.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
                ]),),
              )
              ),
         
           
           
     
     
     ]
        ),
      ),
      ),
    );
    
  }
}