
import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class Welcomepage extends StatelessWidget {
   
  ////check//
 /* Widget buttons({required String name }){
   return Container(
             height: 45,
             width: 220,
                decoration: BoxDecoration(
                   boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                4.0, // Move to right 10  horizontally
                4.0, // Move to bottom 10 Vertically
              ),
            )
          ],
                ),
             
             child:
             RaisedButton(
               color: Colors.red[900],
               
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
                 side: BorderSide(color: Colors.red,width: 2),
                 
                
               ),
               onPressed: (){
               
               

               },
               

               ////buton///
               child: Text(name,style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 10.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
       ]),
               )
           ),
           );

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Expanded(child: Container(
          child: Center(
           child: Image.asset('assets/images/logo.jpg'),
          //chck
          
          

          ),
        )
        ),
       Expanded(child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Text("Welcome To Foodie",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 10.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
            ]
           )),
           Column(
             children: [
               Text("order food from our restautrant and"),
               Text("make reservation in real-time")
             ],
           ),
           ////butttons//
           Container(
             height: 45,
             width: 210,
               /* decoration: BoxDecoration(
                   boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                4.0, // Move to right 10  horizontally
                4.0, // Move to bottom 10 Vertically
              ),
            )
          ],
                ),*/
             
             child:
             RaisedButton(
               splashColor: Colors.black,
         elevation: 7,
               color: Colors.red[900],
               
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
                 side: BorderSide(color: Colors.red,width: 2),
                 
                
               ),
               onPressed: (){
               
               Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Login()),  
            ); 

               },
               

               ////buton///
               child: Text("Login",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 13.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
       ]),
               )
           ),
           ),
         
          /* buttons(name: "Login"),
           buttons(name: "Signup")*/

           //second button
            Container(
             height: 45,
             width: 210,
                /*decoration: BoxDecoration(
                   boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                4.0, // Move to right 10  horizontally
                4.0, // Move to bottom 10 Vertically
              ),
            )
          ],
                ),*/
             
             child:
             RaisedButton(
               splashColor: Colors.black,
         elevation: 7,
               color: Colors.red[900],
               
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30),
                 side: BorderSide(color: Colors.red,width: 2),
                 
                
               ),
               onPressed: (){
               
               Navigator.push(  
              context,  
              MaterialPageRoute(builder: (context) => Register()),  
            );  

               },
               

               ////buton///
               child: Text("Signup",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 13.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
       ]),
               )
           ),
           ),
         ],

        ),

        ))
      ],
    ),
    
      
    );
  }
}